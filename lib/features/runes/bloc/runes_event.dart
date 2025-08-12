import 'package:equatable/equatable.dart';

abstract class RunesEvent extends Equatable {
  const RunesEvent();

  @override
  List<Object> get props => [];
}

class FetchRunes extends RunesEvent {}
