import 'package:equatable/equatable.dart';

class SearchState extends Equatable {
  final String selectedRegion;
  final bool isTagFocused;
  final bool isLoading;
  final String? puuid;
  final String? error;

  const SearchState({
    this.selectedRegion = 'EUROPE',
    this.isTagFocused = false,
    this.isLoading = false,
    this.puuid,
    this.error,
  });

  SearchState copyWith({
    String? selectedRegion,
    bool? isTagFocused,
    bool? isLoading,
    String? puuid,
    String? error,
  }) {
    return SearchState(
      selectedRegion: selectedRegion ?? this.selectedRegion,
      isTagFocused: isTagFocused ?? this.isTagFocused,
      isLoading: isLoading ?? this.isLoading,
      puuid: puuid,
      error: error,
    );
  }

  @override
  List<Object?> get props =>
      [selectedRegion, isTagFocused, isLoading, puuid, error];
}