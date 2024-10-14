import 'package:moviesapp/feature/tvs/data/models/tv_genres_model.dart';
import 'package:moviesapp/feature/tvs/data/models/tv_seasons_model.dart';
import 'package:moviesapp/feature/tvs/domain/entities/tv_details.dart';

class TvDetailsModel extends TvDetails {
  const TvDetailsModel({
    required super.id,
    required super.backdropPath,
    required super.title,
    required super.voteAverage,
    required super.releaseDate,
    required super.overView,
    required super.runtime,
    required super.seasonNumber,
    required super.genres,
    required super.season,
  });
  factory TvDetailsModel.fromjson(Map<String, dynamic> json) => TvDetailsModel(
        id: json['id'],
        backdropPath: json['backdrop_path'],
        title: json['name'],
        voteAverage: json['vote_average'].toDouble(),
        releaseDate: json['first_air_date'],
        overView: json['overview'],
        season: json['number_of_seasons'],
        runtime: List<int>.from(json['episode_run_time'].map((e) => e)),
        seasonNumber:
            List.from(json['seasons'].map((e) => TvSeasonsModel.fromJson(e))),
        genres: List.from(
          json['genres'].map(
            (e) => TvGenresModel.fromjson(e),
          ),
        ),
      );
}
