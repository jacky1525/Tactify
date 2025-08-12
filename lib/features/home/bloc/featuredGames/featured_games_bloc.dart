import 'package:flutter_bloc/flutter_bloc.dart';
import 'featured_games_event.dart';
import 'featured_games_state.dart';
import '../../../../data/repositories/lol_repository.dart';

class FeaturedGamesBloc extends Bloc<FeaturedGamesEvent, FeaturedGamesState> {
  final LolRepository lolRepository;

  FeaturedGamesBloc(this.lolRepository) : super(FeaturedGamesInitial()) {
    on<FetchFeaturedGames>(_onFetch);
  }

  Future<void> _onFetch(FetchFeaturedGames event, Emitter<FeaturedGamesState> emit) async {
    emit(FeaturedGamesLoading());
    try {
      final games = await lolRepository.getFeaturedGames();
      emit(FeaturedGamesLoaded(games));
    } catch (e) {
      emit(FeaturedGamesError('Veri alınırken hata oluştu: $e'));
    }
  }
}