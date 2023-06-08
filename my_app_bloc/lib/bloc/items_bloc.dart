import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../models/item.dart';

part 'items_event.dart';
part 'items_state.dart';

class ItemsBloc extends Bloc<ItemsEvent, ItemsState> {
  ItemsBloc(super.LoadItem) {
    on<AddItem>(_addItem);
    on<RemoveItem>(_removeItem);
    // on<CleanList>(_checkList);
  }

  void _addItem(ItemsEvent event, Emitter<ItemsState> emit) {
    if (event is AddItem) {
      final currentState = state as LoadItem;

      final updatedCart = List<Item>.from(currentState.items)..add(event.item);
      emit(LoadItem(updatedCart));
    }
  }

  void _removeItem(ItemsEvent event, Emitter<ItemsState> emit) {
    if (event is RemoveItem) {
      final currentState = state as LoadItem;
      final updatedCart = List<Item>.from(currentState.items)
        ..remove(event.item);
      emit(CleanList());
    }
  }

  // void _checkList(ItemsEvent event, Emitter<ItemsState> emit) {
  //   if (state.items.isEmpty) {
  //     final updatedCart = List<Item>.from(state.items);
  //   }
  // }
}
