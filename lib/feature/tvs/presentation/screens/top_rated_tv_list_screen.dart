import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moviesapp/core/network/api_constance.dart';
import 'package:moviesapp/core/services/services.dart';
import 'package:moviesapp/core/utils/enum.dart';
import 'package:moviesapp/feature/tvs/presentation/controller/tv_list_bloc.dart';

import 'package:shimmer/shimmer.dart';

import 'tv_details_screen.dart';

class TopRatedTvListScreen extends StatelessWidget {
  const TopRatedTvListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          sl<TvListBloc>()..add(GetTopRatedTvListEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Top Rated Tvs',
            style: GoogleFonts.poppins(
              fontSize: 18,
              letterSpacing: 1,
              color: Colors.white,
            ),
          ),
        ),
        body: BlocBuilder<TvListBloc, TvListState>(
          buildWhen: (previous, current) =>
              previous.topRatedTvListState != current.topRatedTvListState,
          builder: (context, state) {
            switch (state.topRatedTvListState) {
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
                    itemCount: state.topRatedTvList.length,
                    itemBuilder: (context, index) {
                      final tv = state.topRatedTvList[index];
                      return Opacity(
                        opacity: 0.8,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        TvDetailScreen(
                                          id: tv.id,
                                          seasonNumber: 1,
                                        )));
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
                                        width: 100.0,
                                        height: 150,
                                        fit: BoxFit.cover,
                                        imageUrl: ApiConstance.imageUrl(
                                            tv.backdropPath!),
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
                                          tv.title,
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
                                                tv.releaseDate.split('-')[0],
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
                                                  (tv.voteAverage / 2)
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
                                                  '(${tv.voteAverage})',
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
                                          tv.overview,
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
                    child: Text(state.popularTvListMessage),
                  ),
                );
            }
          },
        ),
      ),
    );
  }
}
