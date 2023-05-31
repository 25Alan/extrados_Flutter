import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app_bloc/bloc/items_bloc.dart';
import 'package:my_app_bloc/models/item.dart';
import 'package:badges/badges.dart' as badges;
import 'package:my_app_bloc/widgets/widgets.dart';

class InfoScreen extends StatelessWidget {
  InfoScreen({super.key});
  final List<Item> items = [
    Item(name: 'Car', price: 1780),
    Item(name: 'Kart', price: 2450),
    Item(name: 'Snake', price: 540),
    Item(name: 'Mouse', price: 740),
    Item(name: 'Other', price: 5440),
  ];

  @override
  Widget build(BuildContext context) {
    return WidgetDrawer(
      title: AppBar(
        title: const Text('Info'),
        actions: [
          badges.Badge(
            badgeAnimation: const badges.BadgeAnimation.slide(),
            badgeStyle: const badges.BadgeStyle(
              shape: badges.BadgeShape.square,
              badgeColor: Colors.transparent,
            ),
            position: badges.BadgePosition.bottomStart(),
            badgeContent: BlocBuilder<ItemsBloc, ItemsState>(
              builder: (context, state) {
                int count = state.itemsList.length;
                return Text(
                  '$count',
                  style: const TextStyle(color: Colors.greenAccent),
                );
              },
            ),
            child: const Icon(Icons.shopping_cart_rounded),
          )
        ],
      ),
      body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return ListTile(
              title: Text(item.name),
              subtitle: Text('${item.price}'),
              leading: IconButton(
                onPressed: () {
                  final itemsBloc = context.read<ItemsBloc>();
                  final items = itemsBloc.state.itemsList;
                  if (items.any((element) => element.name == item.name)) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('No add'),
                      duration: Duration(seconds: 2),
                    ));
                  } else {
                    itemsBloc.add(AddItem(item));
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Add'),
                      duration: Duration(seconds: 2),
                    ));
                  }
                },
                icon: const FlutterLogo(),
              ),
            );
          }),
    );
  }
}
