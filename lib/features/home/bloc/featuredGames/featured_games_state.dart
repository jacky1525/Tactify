import 'package:equatable/equatable.dart';
import 'package:tactify/data/models/random_games_model.dart';

abstract class FeaturedGamesState extends Equatable {
  const FeaturedGamesState();

  @override
  List<Object?> get props => [];
}

class FeaturedGamesInitial extends FeaturedGamesState {}

class FeaturedGamesLoading extends FeaturedGamesState {}

class FeaturedGamesLoaded extends FeaturedGamesState {
  final RandomGames games;

  const FeaturedGamesLoaded(this.games);

  @override
  List<Object?> get props => [games];
}

class FeaturedGamesError extends FeaturedGamesState {
  final String message;

  const FeaturedGamesError(this.message);

  @override
  List<Object?> get props => [message];
}