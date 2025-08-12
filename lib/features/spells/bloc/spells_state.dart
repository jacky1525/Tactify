import 'package:equatable/equatable.dart';
import 'package:tactify/data/models/spells_model.dart';

abstract class SpellsState extends Equatable {
  const SpellsState();

  @override
  List<Object?> get props => [];
}

class SpellsInitial extends SpellsState {}

class SpellsLoading extends SpellsState {}

class SpellsLoaded extends SpellsState {
  final SpellsModel spells;

  const SpellsLoaded(this.spells);

  @override
  List<Object?> get props => [spells];
}

class SpellsError extends SpellsState {
  final String message;

  const SpellsError(this.message);

  @override
  List<Object?> get props => [message];
}
