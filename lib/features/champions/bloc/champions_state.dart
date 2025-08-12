import 'package:equatable/equatable.dart';
import 'package:tactify/data/models/champions_model.dart';

abstract class ChampionsState extends Equatable {
  const ChampionsState();

  @override
  List<Object?> get props => [];
}

// İlk açılışta boş state
class ChampionsInitial extends ChampionsState {}

// Yükleme durumu
class ChampionsLoading extends ChampionsState {}

// Başarıyla şampiyonlar yüklendiğinde
class ChampionsLoaded extends ChampionsState {
  final ChampionsModel champions;

  const ChampionsLoaded(this.champions);

  @override
  List<Object?> get props => [champions];
}

// Arama sonucu (filtrelenmiş liste)
class ChampionsSearchResult extends ChampionsState {
  final List<Datum> results;

  const ChampionsSearchResult(this.results);
  @override
  List<Object?> get props => [results];
}

// Hata durumu
class ChampionsError extends ChampionsState {
  final String message;

  const ChampionsError(this.message);

  @override
  List<Object?> get props => [message];
}