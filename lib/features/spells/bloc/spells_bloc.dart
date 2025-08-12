import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tactify/data/repositories/lol_repository.dart';
import 'package:tactify/features/spells/bloc/spells_event.dart';
import 'package:tactify/features/spells/bloc/spells_state.dart';

class SpellsBloc extends Bloc<SpellsEvent, SpellsState> {
  final LolRepository lolRepository;

  SpellsBloc({required this.lolRepository}) : super(SpellsInitial()) {
    on<FetchSpells>(_onFetchSpells);
  }

  Future<void> _onFetchSpells(
    FetchSpells event,
    Emitter<SpellsState> emit,
  ) async {
    emit(SpellsLoading());

    try {
      final spells = await lolRepository.getSpells();
      emit(SpellsLoaded(spells!));
    } catch (e) {
      emit(SpellsError(e.toString()));
    }
  }
}
