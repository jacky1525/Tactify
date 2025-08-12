import 'package:equatable/equatable.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class RegionChanged extends SearchEvent {
  final String region;

  const RegionChanged(this.region);

  @override
  List<Object> get props => [region];
}

class SearchSubmitted extends SearchEvent {
  final String gameName;
  final String tagLine;

  const SearchSubmitted({required this.gameName, required this.tagLine});

  @override
  List<Object> get props => [gameName, tagLine];
}

class TagFocusChanged extends SearchEvent {
  final bool isFocused;

  const TagFocusChanged(this.isFocused);

  @override
  List<Object> get props => [isFocused];
}

