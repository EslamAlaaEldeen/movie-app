import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moviesapp/core/network/api_constance.dart';
import 'package:moviesapp/core/utils/enum.dart';
import 'package:moviesapp/feature/Movies/presentation/screens/movie_detail_screen.dart';
import 'package:moviesapp/feature/search/presentation/controller/search_bloc.dart';
import 'package:moviesapp/feature/tvs/presentation/screens/tv_details_screen.dart';
import 'package:shimmer/shimmer.dart';

class ResultsComponents extends StatelessWidget {
  const ResultsComponents({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      // buildWhen: (previous, current) =>
      //     previous.searchState != current.searchState,
      builder: (context, state) {
        switch (state.searchState) {
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
            if (state.search.isEmpty) {
              return const Center(child: Text('No results found.'));
            }
            return FadeIn(
              duration: const Duration(milliseconds: 500),
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                itemCount: state.search.length,
                itemBuilder: (context, index) {
                  final search = state.search[index];

                  return Opacity(
                    opacity: 0.8,
                    child: InkWell(
                      onTap: () {
                        if (search.mediaType == 'movie') {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      MovieDetailScreen(id: search.id)));
                        } else if (search.mediaType == 'tv') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => TvDetailScreen(
                                id: search.id, // Pass the TV show ID
                                seasonNumber:
                                    1, // Default season or handle dynamically
                              ),
                            ),
                          );
                        }
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
                                        search.posterPath),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      search.title,
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
                                    Text(
                                      search.releaseDate,
                                      style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                        letterSpacing: 1,
                                        color: Colors.grey,
                                      ),
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
                child: Text(state.searchMessage),
              ),
            );
        }
      },
    );
  }
}
