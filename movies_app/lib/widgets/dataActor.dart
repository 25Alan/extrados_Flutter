import 'package:flutter/material.dart';
import 'package:movies_app/providers/provider_App.dart';
import 'package:provider/provider.dart';
import 'package:movies_app/models/models.dart';

class ActorInfoWidget extends StatelessWidget {
  final int actorId;

  const ActorInfoWidget({Key? key, required this.actorId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);

    return FutureBuilder<ActorResponse>(
      future: moviesProvider.getActorData(actorId),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final actor = snapshot.data!;

          return const Text('-');
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
