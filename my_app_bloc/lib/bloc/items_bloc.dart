import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../models/item.dart';

part 'items_event.dart';
part 'items_state.dart';

class ItemsBloc extends Bloc<ItemsEvent, ItemsState> {
  ItemsBloc() : super(const ItemsState([])) {
    on<ItemsEvent>((event, emit) {
      if (event is AddItem) {
        final updatedCart = List<Item>.from(state.itemsList)..add(event.item);
        emit(ItemsState(updatedCart));
        emit(LoadItem(updatedCart));
      } else if (event is RemoveItem) {
        final updatedCart = List<Item>.from(state.itemsList)
          ..remove(event.item);
        emit(ItemsState(updatedCart));
        emit(CleanList(updatedCart));
      }
    });
  }
}
