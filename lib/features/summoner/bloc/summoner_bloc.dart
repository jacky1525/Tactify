// summoner_bloc.dart
import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tactify/data/models/match_detail_lite_model.dart';
import 'package:tactify/data/repositories/lol_repository.dart';
import 'package:tactify/features/summoner/bloc/summoner_event.dart';
import 'package:tactify/features/summoner/bloc/summoner_state.dart';
import 'package:tactify/features/summoner/mappers/match_detail_mapper.dart';

const int _kIdsCount = 20; // tek seferde ID
const int _kMaxShow = 20; // toplam üst sınır
const int _kFirstBatch = 5; // başlangıçta göster ve yükle

class SummonerBloc extends Bloc<SummonerEvent, SummonerState> {
  final LolRepository lolRepository;
  SummonerBloc(this.lolRepository) : super(const SummonerState()) {
    on<FetchSummonerInfo>(_onFetchSummonerInfo);
    on<LoadNextMatchDetailsBatch>(_onLoadNextBatch);
    on<ShowMoreMatches>(_onShowMore);
  }

  Timer? _cooldownTimer;
  void _startCooldown(int s, Emitter<SummonerState> emit) {
    _cooldownTimer?.cancel();
    emit(state.copyWith(matchIdsCooldownSec: s));
    _cooldownTimer = Timer.periodic(const Duration(seconds: 1), (t) {
      final cur = state.matchIdsCooldownSec ?? 0;
      if (cur <= 1) {
        t.cancel();
        emit(state.copyWith(matchIdsCooldownSec: null));
      } else {
        emit(state.copyWith(matchIdsCooldownSec: cur - 1));
      }
    });
  }

  @override
  Future<void> close() {
    _cooldownTimer?.cancel();
    return super.close();
  }

  Future<void> _onFetchSummonerInfo(
    FetchSummonerInfo e,
    Emitter<SummonerState> emit,
  ) async {
    emit(
      state.copyWith(
        isLoading: true,
        error: null,
        routingRegion: e.region.toLowerCase(),
        matchIds: const [],
        isMatchIdsLoading: false,
        matchIdsHasMore: false,
        matchIdsCooldownSec: null,
        matchDetailsLite: const {},
        isDetailsLoading: false,
        detailsNextIndex: 0,
        visibleMatchCount: 0,
      ),
    );

    try {
      final platform = await lolRepository.getRegionByPuuid(
        region: e.region,
        puuid: e.puuid,
      );
      final summoner = await lolRepository.getSummonerInfo(
        region: platform,
        puuid: e.puuid,
      );

      emit(
        state.copyWith(
          isLoading: false,
          summoner: summoner,
          platformRegion: platform,
        ),
      );

      // opsiyonel
      try {
        final leagues = await lolRepository.getLeagues(
          platformRegion: platform,
          puuid: summoner.puuid,
        );
        final masteries = await lolRepository.getTopChampionMasteries(
          platformRegion: platform,
          puuid: summoner.puuid,
        );
        emit(state.copyWith(leagues: leagues, topMasteries: masteries));
      } catch (_) {}

      // ID'ler — tek istek
      emit(state.copyWith(isMatchIdsLoading: true));
      try {
        final ids = await lolRepository.getMatchIds(
          routingRegion: state.routingRegion!,
          puuid: summoner.puuid,
          start: 0,
          count: _kIdsCount,
        );
        final clipped = ids.take(_kMaxShow).toList();

        // ilk 5 görünür + ilk 5’in detayını çek
        emit(
          state.copyWith(
            isMatchIdsLoading: false,
            matchIds: clipped,
            matchIdsHasMore: false,
            detailsNextIndex: 0,
            visibleMatchCount: clipped.isEmpty
                ? 0
                : _kFirstBatch.clamp(0, clipped.length),
          ),
        );
        if (clipped.isNotEmpty) {
          add(const LoadNextMatchDetailsBatch(count: _kFirstBatch));
        }
      } on RateLimitException catch (ex) {
        _startCooldown(ex.retryAfterSeconds, emit);
        emit(state.copyWith(isMatchIdsLoading: false));
      }
    } catch (err) {
      emit(
        state.copyWith(
          isLoading: false,
          isMatchIdsLoading: false,
          error: 'Hesap bilgileri alınamadı: $err',
        ),
      );
    }
  }

  // Görünür sayıyı artır (buton)
  Future<void> _onShowMore(
    ShowMoreMatches e,
    Emitter<SummonerState> emit,
  ) async {
    if (state.matchIds.isEmpty) return;
    final newVisible = (state.visibleMatchCount + e.step).clamp(
      0,
      state.matchIds.length,
    );
    if (newVisible == state.visibleMatchCount) return;

    emit(state.copyWith(visibleMatchCount: newVisible));

    // Eğer henüz indirilmeyen görünür ID’ler varsa, sadece onların detayını çek
    if (state.detailsNextIndex < newVisible) {
      final missing = newVisible - state.detailsNextIndex;
      add(LoadNextMatchDetailsBatch(count: missing));
    }
  }

  // Detayları parça parça çek — SADECE görünür dilim için
  Future<void> _onLoadNextBatch(
    LoadNextMatchDetailsBatch e,
    Emitter<SummonerState> emit,
  ) async {
    if (state.isDetailsLoading) return;
    final routing = state.routingRegion;
    final ids = state.matchIds;
    final puuid = state.summoner?.puuid;
    if (routing == null || puuid == null || ids.isEmpty) return;

    final start = state.detailsNextIndex;
    if (start >= ids.length) return;

    final end = (start + e.count) > ids.length ? ids.length : (start + e.count);
    final slice = ids.sublist(start, end);

    emit(state.copyWith(isDetailsLoading: true));

    final liteMap = Map<String, MatchDetailLiteModel>.from(
      state.matchDetailsLite,
    );
    var nextIndex = start;

    for (final id in slice) {
      var done = false;
      while (!done) {
        try {
          // 1) FULL çek
          final full = await lolRepository.getMatchDetail(
            routingRegion: routing,
            matchId: id,
          );
          // 2) LITE üret
          final lite = full.toLiteModel();
          // 3) State’e yaz
          liteMap[id] = lite;
          done = true;
        } on RateLimitException catch (ex) {
          _startCooldown(ex.retryAfterSeconds, emit);
          await Future.delayed(Duration(seconds: ex.retryAfterSeconds));
        } catch (_) {
          done = true; // bu id’yi atla
        }
      }

      nextIndex++;
      emit(
        state.copyWith(matchDetailsLite: liteMap, detailsNextIndex: nextIndex),
      );

      if (e.spacing.inMilliseconds > 0) {
        await Future.delayed(e.spacing);
      }
    }

    emit(state.copyWith(isDetailsLoading: false));
  }
}
