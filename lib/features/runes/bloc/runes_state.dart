import 'package:equatable/equatable.dart';
import 'package:tactify/data/models/runes_model.dart';

abstract class RunesState extends Equatable {
  const RunesState();

  @override
  List<Object?> get props => [];
}

class RunesInitial extends RunesState {}

class RunesLoading extends RunesState {}

class RunesLoaded extends RunesState {
  final List<RunesModel> runes;

  const RunesLoaded(this.runes);

  @override
  List<Object?> get props => [runes];
}

class RunesError extends RunesState {
  final String message;

  const RunesError(this.message);

  @override
  List<Object?> get props => [message];
}
