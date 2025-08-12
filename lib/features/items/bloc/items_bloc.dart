import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tactify/data/models/items_model.dart';
import 'package:tactify/data/repositories/lol_repository.dart';
import 'package:tactify/features/items/bloc/items_event.dart';
import 'package:tactify/features/items/bloc/items_state.dart';

class ItemsBloc extends Bloc<ItemsEvent, ItemsState> {
  final LolRepository lolRepository;

  // Tüm item'lar burada tutulur
  List<Datum> itemCache = [];

  ItemsBloc({required this.lolRepository}) : super(ItemsInitial()) {
    on<FetchItems>(_onFetchItems);
    on<SearchItems>(_onSearchItems);
  }

  Future<void> _onFetchItems(FetchItems event, Emitter<ItemsState> emit) async {
    emit(ItemsLoading());
    try {
      final items = await lolRepository.getItems();
      if (items != null) {
        itemCache = items; // cache’le
        emit(ItemsLoaded(items));
      } else {
        emit(const ItemsError('Eşya verisi alınamadı.'));
      }
    } catch (e) {
      emit(ItemsError(e.toString()));
    }
  }

  void _onSearchItems(SearchItems event, Emitter<ItemsState> emit) {
    final query = event.query.toLowerCase();

    final List<Datum> filtered = query.isEmpty
        ? itemCache
        : itemCache.where((item) {
            return item.name.toLowerCase().contains(query);
          }).toList();

    emit(ItemsLoaded(filtered));
  }
}
