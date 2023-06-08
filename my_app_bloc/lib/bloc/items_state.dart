part of 'items_bloc.dart';

class ItemsState extends Equatable {
  @override
  List<Object> get props => [];
}

// class ItemsInitial extends ItemsState {
//   ItemsInitial();
// }

class LoadItem extends ItemsState {
  LoadItem(this.items);
  final List<Item> items;

  @override
  List<Object> get props => [items];
}

class CleanList extends ItemsState {}
