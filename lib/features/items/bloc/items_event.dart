import 'package:equatable/equatable.dart';

abstract class ItemsEvent extends Equatable {
  const ItemsEvent();

  @override
  List<Object> get props => [];
}

class FetchItems extends ItemsEvent {}

class SearchItems extends ItemsEvent {
  final String query;
  const SearchItems(this.query);
}
