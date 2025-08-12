import 'package:equatable/equatable.dart';
import 'package:tactify/data/models/champion_mastery_model.dart';
import 'package:tactify/data/models/league_model.dart';
import 'package:tactify/data/models/match_detail_model.dart';
import 'package:tactify/data/models/match_detail_lite_model.dart';
import 'package:tactify/data/models/summoner_info_model.dart';

class SummonerState extends Equatable {
  final bool isLoading;
  final SummonerInfoModel? summoner;
  final String? error;

  final LeaguesSummary? leagues;
  final List<ChampionMastery> topMasteries;

  // Routing / platform
  final String? routingRegion;
  final String? platformRegion;

  // Match IDs
  final List<String> matchIds;
  final bool isMatchIdsLoading;
  final bool matchIdsHasMore; // artık hep false olacak (tek çağrı)
  final int? matchIdsCooldownSec; // 429 için görsel geri sayım

  /// Full match details (heavy model) keyed by matchId.
  final Map<String, MatchDetailModel> matchDetailsFull;
  /// Lite match details (used for list UI) keyed by matchId.
  final Map<String, MatchDetailLiteModel> matchDetailsLite;

  @Deprecated('Use matchDetailsFull for full API objects, or matchDetailsLite for list items.')
  Map<String, MatchDetailModel> get matchDetails => matchDetailsFull;

  final bool isDetailsLoading; // batch yükleniyor mu
  final int detailsNextIndex; // sıradaki index (kaç detay indirildi)
  final int
  visibleMatchCount; // ekranda gösterilecek maç sayısı (detay çekilecekler)

  const SummonerState({
    this.isLoading = false,
    this.summoner,
    this.error,
    this.leagues,
    this.topMasteries = const [],
    this.routingRegion,
    this.platformRegion,
    this.matchIds = const [],
    this.isMatchIdsLoading = false,
    this.matchIdsHasMore = false,
    this.matchIdsCooldownSec,
    this.matchDetailsFull = const {},
    this.isDetailsLoading = false,
    this.detailsNextIndex = 0,
    this.visibleMatchCount = 0,
    this.matchDetailsLite = const {},

  });

  SummonerState copyWith({
    bool? isLoading,
    SummonerInfoModel? summoner,
    String? error,
    LeaguesSummary? leagues,
    List<ChampionMastery>? topMasteries,
    String? routingRegion,
    String? platformRegion,
    List<String>? matchIds,
    bool? isMatchIdsLoading,
    bool? matchIdsHasMore,
    int? matchIdsCooldownSec,
    // Full / Lite maps
    Map<String, MatchDetailModel>? matchDetails,        // backward-compat (deprecated)
    Map<String, MatchDetailModel>? matchDetailsFull,    // preferred
    bool? isDetailsLoading,
    int? detailsNextIndex,
    int? visibleMatchCount,
    Map<String, MatchDetailLiteModel>? matchDetailsLite,
  }) {
    return SummonerState(
      isLoading: isLoading ?? this.isLoading,
      summoner: summoner ?? this.summoner,
      error: error,
      leagues: leagues ?? this.leagues,
      topMasteries: topMasteries ?? this.topMasteries,
      routingRegion: routingRegion ?? this.routingRegion,
      platformRegion: platformRegion ?? this.platformRegion,
      matchIds: matchIds ?? this.matchIds,
      isMatchIdsLoading: isMatchIdsLoading ?? this.isMatchIdsLoading,
      matchIdsHasMore: matchIdsHasMore ?? this.matchIdsHasMore,
      matchIdsCooldownSec: matchIdsCooldownSec,
      matchDetailsFull: matchDetailsFull ?? matchDetails ?? this.matchDetailsFull,
      isDetailsLoading: isDetailsLoading ?? this.isDetailsLoading,
      detailsNextIndex: detailsNextIndex ?? this.detailsNextIndex,
       visibleMatchCount: visibleMatchCount ?? this.visibleMatchCount,
       matchDetailsLite: matchDetailsLite ?? this.matchDetailsLite,
    );
  }

  @override
  List<Object?> get props => [
    isLoading,
    summoner,
    error,
    leagues,
    topMasteries,
    routingRegion,
    platformRegion,
    matchIds,
    isMatchIdsLoading,
    matchIdsHasMore,
    matchIdsCooldownSec,
    matchDetailsFull,
    isDetailsLoading,
    detailsNextIndex,
    visibleMatchCount,
    matchDetailsLite,
  ];
}
