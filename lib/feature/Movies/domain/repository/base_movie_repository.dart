import 'package:dartz/dartz.dart';

import 'package:moviesapp/core/Parameters/movie_parameter.dart';
import 'package:moviesapp/core/error/failure.dart';
import 'package:moviesapp/feature/Movies/domain/entities/Movie_details.dart';
import 'package:moviesapp/feature/Movies/domain/entities/movie.dart';
import 'package:moviesapp/feature/Movies/domain/entities/movies_list.dart';
import 'package:moviesapp/feature/Movies/domain/entities/recommendation.dart';

abstract class BaseMovieRepository {
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies();
  Future<Either<Failure, List<Movie>>> getPopularMovies();
  Future<Either<Failure, List<Movie>>> getTopRatedMovies();
  Future<Either<Failure, MovieDetails>> getMovieDetails(
      MovieDetailsParameters parameters);
  Future<Either<Failure, List<Recommendation>>> getRecommendation(
      RecommendationParameters parameters);
  Future<Either<Failure, List<MoviesList>>> getPopularMoviesList();
  Future<Either<Failure, List<MoviesList>>> getTopRatedMoviesList();
}
