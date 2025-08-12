import 'package:equatable/equatable.dart';

abstract class SpellsEvent extends Equatable {
  const SpellsEvent();

  @override
  List<Object> get props => [];
}

class FetchSpells extends SpellsEvent {}
