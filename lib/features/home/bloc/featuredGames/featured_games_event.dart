import 'package:equatable/equatable.dart';

abstract class FeaturedGamesEvent extends Equatable {
  const FeaturedGamesEvent();

  @override
  List<Object> get props => [];
}

class FetchFeaturedGames extends FeaturedGamesEvent {}