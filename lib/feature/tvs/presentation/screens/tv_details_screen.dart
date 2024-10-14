import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moviesapp/core/network/api_constance.dart';
import 'package:moviesapp/core/services/services.dart';
import 'package:moviesapp/core/utils/enum.dart';
import 'package:moviesapp/feature/tvs/domain/entities/tv_genres.dart';
import 'package:moviesapp/feature/tvs/presentation/controller/tv_details_bloc.dart';

import 'package:shimmer/shimmer.dart';

class TvDetailScreen extends StatelessWidget {
  final int id;
  final int seasonNumber;
  const TvDetailScreen({Key? key, required this.id, required this.seasonNumber})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => sl<TvDetailsBloc>()
        ..add(GetTvDetailsEvent(id))
        ..add(GetTvRecommendationEvent(id))
        ..add(GetTvEpisodesEvent(id, seasonNumber)),
      lazy: false,
      child: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: const TvDetailContent(),
      ),
    );
  }
}

class TvDetailContent extends StatefulWidget {
  const TvDetailContent({
    Key? key,
  }) : super(key: key);

  @override
  State<TvDetailContent> createState() => _TvDetailContentState();
}

class _TvDetailContentState extends State<TvDetailContent> {
  PageController pageController = PageController(initialPage: 0);
  int currentPageIndex = 0;

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvDetailsBloc, TvDetailsState>(
      builder: (context, state) {
        switch (state.tvDetailsState) {
          case RequestState.loading:
            return const Center(
                child: CircularProgressIndicator(
              color: Colors.blue,
            ));
          case RequestState.success:
            return CustomScrollView(
              physics: const BouncingScrollPhysics(),
              key: const Key('tvDetailScrollView'),
              slivers: [
                SliverAppBar(
                  pinned: true,
                  expandedHeight: 250.0,
                  flexibleSpace: FlexibleSpaceBar(
                    background: FadeIn(
                      duration: const Duration(milliseconds: 500),
                      child: ShaderMask(
                        shaderCallback: (rect) {
                          return const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black,
                              Colors.black,
                              Colors.transparent,
                            ],
                            stops: [0.0, 0.5, 1.0, 1.0],
                          ).createShader(
                            Rect.fromLTRB(0.0, 0.0, rect.width, rect.height),
                          );
                        },
                        blendMode: BlendMode.dstIn,
                        child: CachedNetworkImage(
                          width: MediaQuery.of(context).size.width,
                          imageUrl: ApiConstance.imageUrl(
                              state.tvDetails!.backdropPath),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: FadeInUp(
                    from: 20,
                    duration: const Duration(milliseconds: 500),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(state.tvDetails!.title,
                              style: GoogleFonts.poppins(
                                  fontSize: 23,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 1.2,
                                  color: Colors.white)),
                          const SizedBox(height: 8.0),
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 2.0,
                                  horizontal: 8.0,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.grey[800],
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                                child: Text(
                                  state.tvDetails!.releaseDate.split('-')[0],
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
                                    (state.tvDetails!.voteAverage / 2)
                                        .toStringAsFixed(1),
                                    style: const TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 1.2,
                                        color: Colors.white),
                                  ),
                                  const SizedBox(width: 4.0),
                                  Text(
                                    '(${state.tvDetails!.voteAverage})',
                                    style: const TextStyle(
                                      fontSize: 1.0,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 1.2,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 16.0),
                              Text(
                                '${(state.tvDetails!.season)} Seasons',
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(width: 16.0),
                              Text(
                                _showDuration(state.tvDetails!.runtime),
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 1.2,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20.0),
                          Text(
                            state.tvDetails!.overView,
                            style: const TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 1.2,
                                color: Colors.white),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            'Genres: ${_showGenres(state.tvDetails!.genres)}',
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 12.0,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Container(
                            height: 3,
                            width: 200,
                            color: currentPageIndex == 0
                                ? Colors.red
                                : Colors.grey.shade900,
                          ),
                          TextButton(
                            child: Text(
                              'Episodes'.toUpperCase(),
                              style: const TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 1.2,
                                  color: Colors.white),
                            ),
                            onPressed: () {
                              pageController.animateToPage(
                                0,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                              setState(() {
                                currentPageIndex = 0;
                              });
                            },
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            height: 3,
                            width: 180,
                            color: currentPageIndex == 1
                                ? Colors.red
                                : Colors.grey.shade900,
                          ),
                          TextButton(
                            child: Text(
                              'More like this'.toUpperCase(),
                              style: const TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 1.2,
                                  color: Colors.white),
                            ),
                            onPressed: () {
                              pageController.animateToPage(
                                1,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                              setState(() {
                                currentPageIndex = 1;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return SizedBox(
                        height: 500,
                        child: PageView(
                          controller: pageController,
                          onPageChanged: (index) {
                            setState(() {
                              currentPageIndex = index;
                            });
                          },
                          children: [
                            _showEpisodes(),
                            _showRecommendations(),
                          ],
                        ),
                      );
                    },
                    childCount: 1,
                  ),
                ),
              ],
            );

          case RequestState.error:
            return Center(child: Text(state.tvDetailsMessage));
        }
      },
    );
  }

  String _showGenres(List<TvGenres> genres) {
    String result = '';
    for (var genre in genres) {
      result += '${genre.name}, ';
    }

    if (result.isEmpty) {
      return result;
    }

    return result.substring(0, result.length - 2);
  }

  String _showDuration(List<int> runtime) {
    if (runtime.isEmpty) {
      return '?? min';
    }
    final int totalRuntime = runtime[0];
    final int hours = totalRuntime ~/ 60;
    final int minutes = totalRuntime % 60;

    if (hours > 0) {
      return '${hours}h ${minutes}m';
    } else {
      return '${minutes}m';
    }
  }

  Widget _showRecommendations() {
    return BlocBuilder<TvDetailsBloc, TvDetailsState>(
      builder: (context, state) {
        return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 0.7,
            ),
            itemBuilder: (BuildContext context, int index) {
              final recommendation = state.tvRecommendation[index];
              return FadeInUp(
                from: 20,
                duration: const Duration(milliseconds: 500),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                  child: CachedNetworkImage(
                    imageUrl: ApiConstance.imageUrl(recommendation.poster),
                    placeholder: (context, url) => Shimmer.fromColors(
                      baseColor: Colors.grey[850]!,
                      highlightColor: Colors.grey[800]!,
                      child: Container(
                        height: 170.0,
                        width: 120.0,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                    height: 180.0,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
            itemCount: state.tvRecommendation.length);
      },
    );
  }

  String? selectedSeason;
  Widget _showEpisodes() {
    return BlocBuilder<TvDetailsBloc, TvDetailsState>(
        builder: (context, state) {
      List<String> seasons = List.generate(
        state.tvDetails!.seasonNumber.length,
        (index) {
          if (state.tvDetails!.seasonNumber.length == 1) {
            return 'Season 1';
          }
          return 'Season $index';
        },
      );
      if (selectedSeason == null && seasons.length > 1) {
        selectedSeason = seasons[1];
      } else if (seasons.length == 1) {
        selectedSeason = seasons[0];
      }
      return StatefulBuilder(builder: (context, setState) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 12),
              child: DropdownButton<String>(
                isExpanded: true,
                hint: Text(selectedSeason.toString()),
                value: selectedSeason,
                items: seasons.map((String season) {
                  return DropdownMenuItem<String>(
                    value: season,
                    child: Text(season,
                        style: const TextStyle(color: Colors.white)),
                  );
                }).toList(),
                onChanged: (String? newVal) {
                  setState(() {
                    selectedSeason = newVal;
                  });
                  final newSeasonNumber = int.parse(newVal!.split(' ')[1]);
                  context.read<TvDetailsBloc>().add(
                      GetTvEpisodesEvent(state.tvDetails!.id, newSeasonNumber));
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: state.tvEpisodes.length,
                itemBuilder: (context, index) {
                  final ep = state.tvEpisodes[index];
                  int number = index + 1;
                  return Opacity(
                    opacity: 0.8,
                    child: Card(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(8.0)),
                                    child: CachedNetworkImage(
                                      width: 150.0,
                                      height: 100,
                                      fit: BoxFit.cover,
                                      imageUrl:
                                          ApiConstance.imageUrl(ep.poster),
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
                                        '$number. ${ep.name}',
                                        style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700,
                                          letterSpacing: 1,
                                          color: Colors.white,
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: 6.0),
                                      Text(
                                        ep.releaseDate,
                                        style: const TextStyle(
                                            fontSize: 13.0,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white70),
                                      ),
                                      const SizedBox(width: 16.0),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            ep.overView,
                            style: const TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 1,
                                color: Colors.white70),
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 8.0),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      });
    });
  }
}
