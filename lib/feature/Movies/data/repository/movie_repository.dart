import 'package:dartz/dartz.dart';

import 'package:moviesapp/core/Parameters/movie_parameter.dart';
import 'package:moviesapp/core/error/exceptions.dart';
import 'package:moviesapp/core/error/failure.dart';
import 'package:moviesapp/feature/Movies/data/datasource/movie_remote_data_source.dart';
import 'package:moviesapp/feature/Movies/domain/entities/Movie_details.dart';
import 'package:moviesapp/feature/Movies/domain/entities/movie.dart';
import 'package:moviesapp/feature/Movies/domain/entities/movies_list.dart';
import 'package:moviesapp/feature/Movies/domain/entities/recommendation.dart';
import 'package:moviesapp/feature/Movies/domain/repository/base_movie_repository.dart';

class MovieRepository extends BaseMovieRepository {
  final BaseMovieRemoteDataSource baseMovieRemoteDataSource;

  MovieRepository(this.baseMovieRemoteDataSource);

  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies() async {
    final result = await baseMovieRemoteDataSource.getNowPlayingMovie();
    try {
      return right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    final result = await baseMovieRemoteDataSource.getPopularMovies();
    try {
      return right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
    final result = await baseMovieRemoteDataSource.getTopRatedMovies();
    try {
      return right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetails>> getMovieDetails(
      MovieDetailsParameters parameters) async {
    final result = await baseMovieRemoteDataSource.getMovieDetails(parameters);
    try {
      return right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Recommendation>>> getRecommendation(
      RecommendationParameters parameters) async {
    final result =
        await baseMovieRemoteDataSource.getRecommendation(parameters);
    try {
      return right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<MoviesList>>> getPopularMoviesList() async {
    final result = await baseMovieRemoteDataSource.getPopularMoviesList();
    try {
      return right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<MoviesList>>> getTopRatedMoviesList() async {
    final result = await baseMovieRemoteDataSource.getTopRatedMoviesList();
    try {
      return right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
