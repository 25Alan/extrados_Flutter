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
        body: const Text('NULL'));
  }
  // BlocBuilder<ItemsBloc, ItemsState>(builder: (context, state) {
  //   if (state.items.isEmpty) {
  // } else {
//           return ListView.builder(
//               itemCount: state.items.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text(state.items[index].name),
//                   subtitle: Text('${state.items[index].price}'),
//                   leading: IconButton(
//                     onPressed: () {
//                       showDialog(
//                         context: context,
//                         builder: (BuildContext context) {
//                           return AlertDialog(
//                             title: const Text('Confirmation'),
//                             content: const Text(
//                                 'Are you sure you want to perform this action?'),
//                             actions: <Widget>[
//                               FloatingActionButton(
//                                 child: const Text('Cancel'),
//                                 onPressed: () {
//                                   Navigator.of(context).pop(
//                                       false); // Cierra el cuadro de diálogo y retorna false
//                                 },
//                               ),
//                               FloatingActionButton(
//                                 child: const Text('Accept'),
//                                 onPressed: () {
//                                   Navigator.of(context).pop(
//                                       true); // Cierra el cuadro de diálogo y retorna true
//                                 },
//                               ),
//                             ],
//                           );
//                         },
//                       ).then((value) {
//                         if (value != null && value) {
//                           final cartBloc = BlocProvider.of<ItemsBloc>(context);
//                           cartBloc.add(RemoveItem(state.items[index]));
//                           // Realizar la acción después de la confirmación
//                         } else {
//                           // Cancelar la acción o realizar otra acción en caso de cancelación
//                         }
//                       });
//                     },
//                     icon: const FlutterLogo(),
//                   ),
//                 );
//               });
//         }
//       }),
//     );
//   }
// }
}
