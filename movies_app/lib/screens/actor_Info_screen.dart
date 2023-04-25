// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:movies_app/models/models.dart';
import 'package:movies_app/providers/provider_App.dart';
import 'package:provider/provider.dart';

class Actor_Info_Screen extends StatelessWidget {
  final int idActor;

  const Actor_Info_Screen({super.key, required this.idActor});

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context, listen: false);
    return Scaffold(
      body: FutureBuilder(
        future: moviesProvider.getActorData(idActor),
        builder: (_, AsyncSnapshot<ActorResponse> snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data!;
            String imageUrl =
                'https://image.tmdb.org/t/p/w500/${data.profilePath}';
            final TextTheme textTheme = Theme.of(context).textTheme;

            return Container(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: FadeInImage(
                        placeholder:
                            const AssetImage('assets/load-svgrepo-com.png'),
                        image: NetworkImage(imageUrl),
                        height: 200,
                        width: 130,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      color: const Color.fromARGB(255, 39, 51, 143),
                      elevation: 10,
                      margin: const EdgeInsets.only(top: 25),
                      shadowColor: const Color.fromRGBO(78, 106, 79, 1),
                      child: SizedBox(
                        width: 300,
                        height: 400,
                        child: Column(
                          children: [
                            Text(
                              data.name,
                              style: textTheme.headlineSmall,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: 250,
                              height: 160,
                              child: SingleChildScrollView(
                                child: Text(
                                  'Biography: ${data.biography}',
                                  textAlign: TextAlign.justify,
                                  style: textTheme.bodyMedium,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.star_outlined),
                                Text(
                                  data.popularity.toString(),
                                  textAlign: TextAlign.start,
                                  style: textTheme.bodySmall,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Place of Birth: ${data.placeOfBirth}',
                              textAlign: TextAlign.start,
                              style: textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
