import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tactify/data/repositories/lol_repository.dart';
import 'package:tactify/features/champions/championDetail/bloc/champion_detail_event.dart';
import 'package:tactify/features/champions/championDetail/bloc/champion_detail_state.dart';

class ChampionDetailBloc extends Bloc<ChampionDetailEvent, ChampionDetailState> {
  final LolRepository repository;

  ChampionDetailBloc(this.repository) : super(ChampionDetailInitial()) {
    on<FetchChampionDetail>((event, emit) async {
      emit(ChampionDetailLoading());
      try {
        final champion = await repository.fetchChampionDetail(event.championName);
        emit(ChampionDetailLoaded(champion!));
      } catch (e) {
        emit(ChampionDetailError(e.toString()));
      }
    });
  }
}
