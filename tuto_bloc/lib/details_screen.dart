import 'package:flutter/material.dart';
import 'package:tuto_bloc/models/user_models.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.e});

  final UserModel e;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Center(
                child: CircleAvatar(
                  maxRadius: 60,
                  backgroundImage: NetworkImage(e.avatar),
                ),
              ),
              Text('${e.firstname} ${e.lastname}'),
              Text(e.email),
            ],
          ),
        ),
      ),
    );
  }
}
