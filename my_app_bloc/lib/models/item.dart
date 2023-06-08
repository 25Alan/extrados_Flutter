import 'package:equatable/equatable.dart';

class Item extends Equatable {
  final String name;
  final int price;
  final bool available;

  const Item(this.available, {required this.name, required this.price});

  @override
  List<Object?> get props => [
        name,
        price,
      ];
}
