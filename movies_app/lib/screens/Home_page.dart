import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:movies_app/search/search_delegate.dart';
import 'package:movies_app/providers/provider_App.dart';
import 'package:movies_app/widgets/widgets.dart';

class Home_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Movies app - Romero Alan'),
          backgroundColor: const Color.fromARGB(255, 31, 36, 174),
          elevation: 0,
          actions: [
            IconButton(
              icon: const Icon(Icons.search_outlined),
              onPressed: () =>
                  showSearch(context: context, delegate: MovieSearchDelegate()),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Movies in cinema',
                  style: TextStyle(
                    color: Color.fromRGBO(203, 203, 203, 1),
                    fontSize: 25,
                  ),
                ),
              ),
              CardSwiper(movies: moviesProvider.onDisplayMovies),
              MovieSlider(
                movies: moviesProvider.popularMovies,
                title: 'Popular',
                onNextPage: () => moviesProvider.getPopularMovies(),
              ),
              // ActorSlider(
              //   actors: moviesProvider.actorsPopular,
              //   title: 'Actores',
              //   onNextPage: () => moviesProvider.getActorsPopular(),
              // )
            ],
          ),
        ));
  }
}
