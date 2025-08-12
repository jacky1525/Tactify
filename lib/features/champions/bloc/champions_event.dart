import 'package:equatable/equatable.dart';

abstract class ChampionsEvent extends Equatable {
  const ChampionsEvent();

  @override
  List<Object> get props => [];
}

// Şampiyonları çekmek için tetiklenen event
class FetchChampions extends ChampionsEvent {}

class SearchChampions extends ChampionsEvent {
  final String query;

  const SearchChampions(this.query);

  @override
  List<Object> get props => [query];
}
