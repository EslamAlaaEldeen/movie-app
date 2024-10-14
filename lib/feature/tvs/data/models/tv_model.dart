import 'package:moviesapp/feature/tvs/domain/entities/tv.dart';

class TvModel extends Tv {
  const TvModel({
    required super.id,
    required super.title,
    required super.backdropPath,
    required super.genreIds,
    required super.overview,
    required super.voteAverage,
    required super.releaseDate,
  });

  factory TvModel.fromjson(Map<String, dynamic> json) => TvModel(
        id: json['id'],
        title: json['name'],
        backdropPath: json['poster_path'],
        genreIds: List<int>.from(json['genre_ids'].map((e) => e)),
        overview: json['overview'],
        voteAverage: json['vote_average'].toDouble(),
        releaseDate: json['first_air_date'],
      );
}
