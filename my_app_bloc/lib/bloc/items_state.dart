part of 'items_bloc.dart';

class ItemsState extends Equatable {
  const ItemsState(this.itemsList);

  final List<Item> itemsList;

  @override
  List<Object> get props => [];
}

class ItemsInitial extends ItemsState {
  const ItemsInitial(super.itemsList);
}

class LoadItem extends ItemsState {
  const LoadItem(super.itemsList);
}

class CleanList extends ItemsState {
  const CleanList(super.itemsList);
}
