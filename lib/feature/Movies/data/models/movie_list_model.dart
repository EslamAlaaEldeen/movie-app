import 'package:moviesapp/feature/Movies/domain/entities/movies_list.dart';

class MoviesListModel extends MoviesList {
  const MoviesListModel(
      {required super.id,
      required super.title,
      required super.backdropPath,
      required super.overview,
      required super.voteAverage,
      required super.releaseDate});
  factory MoviesListModel.fromjson(Map<String, dynamic> json) =>
      MoviesListModel(
          id: json['id'],
          title: json['title'],
          backdropPath: json['poster_path'],
          overview: json['overview'],
          voteAverage: json['vote_average'],
          releaseDate: json['release_date']);
}
