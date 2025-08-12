import 'package:equatable/equatable.dart';
import 'package:tactify/data/models/champion_info_model.dart';

abstract class ChampionDetailState extends Equatable {
  const ChampionDetailState();
  @override
  List<Object?> get props => [];
}

class ChampionDetailInitial extends ChampionDetailState {}

class ChampionDetailLoading extends ChampionDetailState {}

class ChampionDetailLoaded extends ChampionDetailState {
  final ChampionDetail detail;

  const ChampionDetailLoaded(this.detail);

  @override
  List<Object?> get props => [detail];
}

class ChampionDetailError extends ChampionDetailState {
  final String message;

  const ChampionDetailError(this.message);

  @override
  List<Object?> get props => [message];
}
