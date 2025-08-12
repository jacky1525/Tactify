import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tactify/data/repositories/lol_repository.dart';
import 'search_event.dart';
import 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final LolRepository lolRepository;

  SearchBloc(this.lolRepository) : super(const SearchState()) {
    on<RegionChanged>((event, emit) {
      emit(state.copyWith(selectedRegion: event.region));
    });
    on<TagFocusChanged>((event, emit) {
      emit(state.copyWith(isTagFocused: event.isFocused));
    });

    on<SearchSubmitted>((event, emit) async {
      emit(state.copyWith(isLoading: true, error: null));

      try {
        final cleanedTagLine = event.tagLine.replaceAll('#', '');

        final account = await lolRepository.getAccountInfo(
          region: state.selectedRegion.toLowerCase(),
          gameName: event.gameName,
          tagLine: cleanedTagLine,
        );

        emit(state.copyWith(isLoading: false, puuid: account.puuid));
        print('Puuid: ${account.puuid}, Game Name: ${account.gameName}, Tag Line: ${account.tagLine}');
      } catch (e) {
        emit(
          state.copyWith(
            isLoading: false,
            error: 'Arama başarısız oldu: ${e.toString()}',
          ),
        );
        print('Search error: $e');
      }
    });
  }
}
