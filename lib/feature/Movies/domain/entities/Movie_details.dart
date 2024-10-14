import 'package:equatable/equatable.dart';
import 'package:moviesapp/feature/Movies/domain/entities/genres.dart';

class MovieDetails extends Equatable {
  final String backDropPath;
  final int id;
  final String title;
  final String releaseDate;
  final double voteAverage;
  final int runtime;
  final String overView;
  final List<Genres> genres;

  const MovieDetails(
      {required this.backDropPath,
      required this.id,
      required this.title,
      required this.releaseDate,
      required this.voteAverage,
      required this.runtime,
      required this.overView,
      required this.genres});

  @override
  List<Object?> get props => [
        backDropPath,
        id,
        title,
        releaseDate,
        voteAverage,
        runtime,
        overView,
        genres
      ];
}
