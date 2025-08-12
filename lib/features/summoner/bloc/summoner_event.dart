// summoner_event.dart
import 'package:equatable/equatable.dart';

abstract class SummonerEvent extends Equatable {
  const SummonerEvent();
  @override
  List<Object?> get props => [];
}

class FetchSummonerInfo extends SummonerEvent {
  final String region; // EUROPE/AMERICAS/ASIA
  final String puuid;
  const FetchSummonerInfo({required this.region, required this.puuid});
  @override
  List<Object?> get props => [region, puuid];
}

/// Detayları 5'erlik parça halinde yükle
class LoadNextMatchDetailsBatch extends SummonerEvent {
  final int count;                  // kaç adet detay
  final Duration spacing;           // istekler arası bekleme
  const LoadNextMatchDetailsBatch({
    this.count = 5,
    this.spacing = const Duration(milliseconds: 200),
  });
  @override
  List<Object?> get props => [count, spacing];
}

class ShowMoreMatches extends SummonerEvent {
  final int step; // kaç tane daha açalım (default 5)
  const ShowMoreMatches({this.step = 5});
}