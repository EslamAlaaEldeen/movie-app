import 'package:equatable/equatable.dart';
import 'package:moviesapp/feature/tvs/domain/entities/TvSeasons.dart';

import 'tv_genres.dart';

class TvDetails extends Equatable {
  final int id;
  final String backdropPath;
  final String title;
  final double voteAverage;
  final String releaseDate;
  final String overView;
  final int season;
  final List<int> runtime;
  final List<TvGenres> genres;
  final List<TvSeasons> seasonNumber;

  const TvDetails({
    required this.id,
    required this.backdropPath,
    required this.title,
    required this.voteAverage,
    required this.releaseDate,
    required this.overView,
    required this.season,
    required this.runtime,
    required this.genres,
    required this.seasonNumber,
  });

  @override
  List<Object> get props => [
        id,
        backdropPath,
        title,
        voteAverage,
        releaseDate,
        overView,
        runtime,
        season,
        genres,
        seasonNumber,
      ];
}
