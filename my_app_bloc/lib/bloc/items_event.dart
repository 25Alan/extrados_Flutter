part of 'items_bloc.dart';

sealed class ItemsEvent extends Equatable {
  const ItemsEvent();

  @override
  List<Object> get props => [];
}

class AddItem extends ItemsEvent {
  const AddItem(this.item);

  final Item item;

  @override
  List<Object> get props => [item];
}

class RemoveItem extends ItemsEvent {
  const RemoveItem(this.item);
  final Item item;

  @override
  List<Object> get props => [item];
}
