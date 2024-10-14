import 'package:moviesapp/feature/Movies/data/models/genres_model.dart';
import 'package:moviesapp/feature/Movies/domain/entities/Movie_details.dart';

class MovieDetailModel extends MovieDetails {
  const MovieDetailModel(
      {required super.backDropPath,
      required super.id,
      required super.title,
      required super.releaseDate,
      required super.voteAverage,
      required super.runtime,
      required super.overView,
      required super.genres});
  factory MovieDetailModel.fromjson(Map<String, dynamic> json) =>
      MovieDetailModel(
        backDropPath: json['backdrop_path'],
        id: json['id'],
        title: json['title'],
        releaseDate: json['release_date'],
        voteAverage: json['vote_average'].toDouble(),
        runtime: json['runtime'],
        overView: json['overview'],
        genres: List.from(json['genres'].map((x) => GenresModel.fromjson(x))),
      );
}
