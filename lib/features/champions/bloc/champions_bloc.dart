import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tactify/data/repositories/lol_repository.dart';
import 'package:tactify/features/champions/bloc/champions_event.dart';
import 'package:tactify/features/champions/bloc/champions_state.dart';
import 'package:tactify/data/models/champions_model.dart';

class ChampionsBloc extends Bloc<ChampionsEvent, ChampionsState> {
  final LolRepository lolRepository;
  List<Datum> _allChampions = [];

  ChampionsBloc({required this.lolRepository}) : super(ChampionsInitial()) {
    on<FetchChampions>(_onFetchChampions);
    on<SearchChampions>(_onSearchChampions);
  }

  Future<void> _onFetchChampions(
    FetchChampions event,
    Emitter<ChampionsState> emit,
  ) async {
    emit(ChampionsLoading());
    try {
      final champions = await lolRepository.getChampions();
      if (champions != null) {
        _allChampions = champions.data.values.toList();
        emit(ChampionsLoaded(champions));
      } else {
        emit(const ChampionsError('Şampiyon verisi alınamadı.'));
      }
    } catch (e) {
      emit(ChampionsError(e.toString()));
    }
  }

  void _onSearchChampions(
    SearchChampions event,
    Emitter<ChampionsState> emit,
  ) {
    final query = event.query.toLowerCase();
    final filtered = _allChampions
        .where((champ) => champ.name.toLowerCase().contains(query))
        .toList();

    emit(ChampionsSearchResult(filtered));
  }
}