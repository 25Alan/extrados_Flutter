import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app_bloc/widgets/widget_drawer.dart';

import '../bloc/items_bloc.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WidgetDrawer(
      title: AppBar(
        title: const Text('List'),
      ),
      body: BlocBuilder<ItemsBloc, ItemsState>(builder: (context, state) {
        if (state.itemsList.isEmpty) {
          return const Text('NULL');
        } else {
          return ListView.builder(
              itemCount: state.itemsList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.itemsList[index].name),
                  subtitle: Text('${state.itemsList[index].price}'),
                  leading: IconButton(
                    onPressed: () {
                      final cartBloc = BlocProvider.of<ItemsBloc>(context);
                      cartBloc.add(RemoveItem(state.itemsList[index]));
                    },
                    icon: const FlutterLogo(),
                  ),
                );
              });
        }
      }),
    );
  }
}
