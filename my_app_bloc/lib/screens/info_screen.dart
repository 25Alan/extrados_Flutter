import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app_bloc/bloc/items_bloc.dart';
import 'package:badges/badges.dart' as badges;
import 'package:my_app_bloc/widgets/widgets.dart';

import '../models/item.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key});

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  final List<Item> items = [
    const Item(name: 'Car', price: 1780, true),
    const Item(name: 'Kart', price: 2450, true),
    const Item(name: 'Snake', price: 540, false),
    const Item(name: 'Mouse', price: 740, false),
    const Item(name: 'Other', price: 5440, true),
    const Item(name: 'Other', price: 5440, true),
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
                int count = state.props.length;
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
                onPressed: item.available
                    ? () {
                        final itemsBloc = context.read<ItemsBloc>();
                        final items = itemsBloc.state;
                        // if (items.any((element) => element == item.name)) {
                        //   ScaffoldMessenger.of(context)
                        //       .showSnackBar(const SnackBar(
                        //     content: Text('No add'),
                        //     duration: Duration(seconds: 2),
                        //   ));
                        // } else {
                        itemsBloc.add(AddItem(item));
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text('Add'),
                          duration: Duration(seconds: 2),
                        ));
                      }
                    // }
                    : null,
                icon: const Icon(Icons.add_reaction),
              ),
            );
          }),
    );
  }
}
