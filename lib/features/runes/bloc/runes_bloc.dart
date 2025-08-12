import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tactify/data/repositories/lol_repository.dart';
import 'package:tactify/features/runes/bloc/runes_event.dart';
import 'package:tactify/features/runes/bloc/runes_state.dart';

class RunesBloc extends Bloc<RunesEvent, RunesState> {
  final LolRepository lolRepository;

  RunesBloc({required this.lolRepository}) : super(RunesInitial()) {
    on<FetchRunes>(_onFetchRunes);
  }

  Future<void> _onFetchRunes(
    FetchRunes event,
    Emitter<RunesState> emit,
  ) async {
    emit(RunesLoading());
    try {
      final runes = await lolRepository.getRunes();
      if (runes != null) {
        emit(RunesLoaded(runes));
      } else {
        emit(const RunesError('Rün verisi alınamadı.'));
      }
    } catch (e) {
      emit(RunesError(e.toString()));
    }
  }
}
