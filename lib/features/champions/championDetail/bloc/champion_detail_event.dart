import 'package:equatable/equatable.dart';

abstract class ChampionDetailEvent extends Equatable {
  const ChampionDetailEvent();
  @override
  List<Object> get props => [];
}

class FetchChampionDetail extends ChampionDetailEvent {
  final String championName;

  const FetchChampionDetail(this.championName);

  @override
  List<Object> get props => [championName];
}
