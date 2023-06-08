part of 'items_bloc.dart';

sealed class ItemsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AddItem extends ItemsEvent {
  AddItem(this.item);

  final Item item;

  @override
  List<Object> get props => [item];
}

class RemoveItem extends ItemsEvent {
  RemoveItem(this.item);
  final Item item;

  @override
  List<Object> get props => [item];
}
