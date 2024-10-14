import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:moviesapp/core/network/api_constance.dart';
import 'package:moviesapp/core/services/services.dart';
import 'package:moviesapp/core/utils/enum.dart';
import 'package:moviesapp/feature/Movies/presentation/controller/movie_list_bloc.dart';
import 'package:shimmer/shimmer.dart';

import 'movie_detail_screen.dart';

class PopularListScreen extends StatelessWidget {
  const PopularListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          sl<MovieListBloc>()..add(GetPopularMoviesListEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Popular Movies',
            style: GoogleFonts.poppins(
              fontSize: 18,
              letterSpacing: 1,
              color: Colors.white,
            ),
          ),
        ),
        body: BlocBuilder<MovieListBloc, MovieListState>(
          buildWhen: (previous, current) =>
              previous.popularMoviesListState != current.popularMoviesListState,
          builder: (context, state) {
            switch (state.popularMoviesListState) {
              case RequestState.loading:
                return const SizedBox(
                  height: 400,
                  child: Center(
                    child: CircularProgressIndicator(
                      color: Colors.blue,
                    ),
                  ),
                );
              case RequestState.success:
                return FadeIn(
                  duration: const Duration(milliseconds: 500),
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    itemCount: state.popularMoviesList.length,
                    itemBuilder: (context, index) {
                      final movie = state.popularMoviesList[index];
                      return Opacity(
                        opacity: 0.8,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        MovieDetailScreen(id: movie.id)));
                          },
                          child: Card(
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Container(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(8.0)),
                                      child: CachedNetworkImage(
                                        width: 110.0,
                                        height: 150,
                                        fit: BoxFit.cover,
                                        imageUrl: ApiConstance.imageUrl(
                                            movie.backdropPath),
                                        placeholder: (context, url) =>
                                            Shimmer.fromColors(
                                          baseColor: Colors.grey[850]!,
                                          highlightColor: Colors.grey[800]!,
                                          child: Container(
                                            height: 170.0,
                                            width: 120.0,
                                            decoration: BoxDecoration(
                                              color: Colors.black,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        ),
                                        errorWidget: (context, url, error) =>
                                            const Icon(Icons.error),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: FadeInUp(
                                    from: 20,
                                    duration: const Duration(milliseconds: 500),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          movie.title,
                                          style: GoogleFonts.poppins(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700,
                                            letterSpacing: 1,
                                            color: Colors.white,
                                          ),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const SizedBox(height: 8.0),
                                        Row(
                                          children: [
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                vertical: 2.0,
                                                horizontal: 8.0,
                                              ),
                                              decoration: BoxDecoration(
                                                color: Colors.red,
                                                borderRadius:
                                                    BorderRadius.circular(4.0),
                                              ),
                                              child: Text(
                                                movie.releaseDate.split('-')[0],
                                                style: const TextStyle(
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.white),
                                              ),
                                            ),
                                            const SizedBox(width: 16.0),
                                            Row(
                                              children: [
                                                const Icon(
                                                  Icons.star,
                                                  color: Colors.amber,
                                                  size: 20.0,
                                                ),
                                                const SizedBox(width: 4.0),
                                                Text(
                                                  (movie.voteAverage / 2)
                                                      .toStringAsFixed(1),
                                                  style: const TextStyle(
                                                      fontSize: 16.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      letterSpacing: 1.2,
                                                      color: Colors.white),
                                                ),
                                                const SizedBox(width: 4.0),
                                                Text(
                                                  '(${movie.voteAverage})',
                                                  style: const TextStyle(
                                                    fontSize: 1.0,
                                                    fontWeight: FontWeight.w500,
                                                    letterSpacing: 1.2,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(width: 16.0),
                                          ],
                                        ),
                                        const SizedBox(height: 20.0),
                                        Text(
                                          movie.overview,
                                          style: const TextStyle(
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.w400,
                                              letterSpacing: 1,
                                              color: Colors.white),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const SizedBox(height: 8.0),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              case RequestState.error:
                return SizedBox(
                  height: 400,
                  child: Center(
                    child: Text(state.popularMoviesListMessage),
                  ),
                );
            }
          },
        ),
      ),
    );
  }
}
