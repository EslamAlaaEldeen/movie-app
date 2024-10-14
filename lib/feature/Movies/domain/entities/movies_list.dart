import 'package:equatable/equatable.dart';

class MoviesList extends Equatable {
  final int id;
  final String title;
  final String backdropPath;
  final String overview;
  final double voteAverage;
  final String releaseDate;

  const MoviesList(
      {required this.id,
      required this.title,
      required this.backdropPath,
      required this.overview,
      required this.voteAverage,
      required this.releaseDate});

  @override
  List<Object> get props => [
        id,
        title,
        backdropPath,
        overview,
        voteAverage,
        releaseDate,
      ];
}
