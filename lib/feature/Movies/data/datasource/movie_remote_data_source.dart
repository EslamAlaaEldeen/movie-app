import 'package:dio/dio.dart';

import 'package:moviesapp/core/Parameters/movie_parameter.dart';
import 'package:moviesapp/core/error/exceptions.dart';
import 'package:moviesapp/core/network/api_constance.dart';
import 'package:moviesapp/core/network/error_messages.dart';
import 'package:moviesapp/feature/Movies/data/models/Movie_model.dart';
import 'package:moviesapp/feature/Movies/data/models/movie_detail_model.dart';
import 'package:moviesapp/feature/Movies/data/models/movie_list_model.dart';
import 'package:moviesapp/feature/Movies/data/models/recommendation_model.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovie();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
  Future<MovieDetailModel> getMovieDetails(MovieDetailsParameters parameters);
  Future<List<RecommendationModel>> getRecommendation(
      RecommendationParameters parameters);
  Future<List<MoviesListModel>> getPopularMoviesList();
  Future<List<MoviesListModel>> getTopRatedMoviesList();
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {
  @override
  Future<List<MovieModel>> getNowPlayingMovie() async {
    final response = await Dio().get(ApiConstance.nowPlayingMoviesPath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((e) => MovieModel.fromjson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromjson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await Dio().get(ApiConstance.popularMoviesPath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((e) => MovieModel.fromjson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromjson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final response = await Dio().get(ApiConstance.topRatedMoviesPath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((e) => MovieModel.fromjson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromjson(response.data));
    }
  }

  @override
  Future<MovieDetailModel> getMovieDetails(
      MovieDetailsParameters parameters) async {
    final response =
        await Dio().get(ApiConstance.movieDetailsPath(parameters.movieId));
    if (response.statusCode == 200) {
      return MovieDetailModel.fromjson(response.data);
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromjson(response.data));
    }
  }

  @override
  Future<List<RecommendationModel>> getRecommendation(
      RecommendationParameters parameters) async {
    final response =
        await Dio().get(ApiConstance.recommendationPath(parameters.id));
    if (response.statusCode == 200) {
      return List<RecommendationModel>.from((response.data['results'] as List)
          .map((e) => RecommendationModel.fromjson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromjson(response.data));
    }
  }

  @override
  Future<List<MoviesListModel>> getPopularMoviesList() async {
    final response = await Dio().get(ApiConstance.popularMoviesPath);
    if (response.statusCode == 200) {
      return List<MoviesListModel>.from((response.data['results'] as List)
          .map((e) => MoviesListModel.fromjson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromjson(response.data));
    }
  }

  @override
  Future<List<MoviesListModel>> getTopRatedMoviesList() async {
    final response = await Dio().get(ApiConstance.topRatedMoviesPath);
    if (response.statusCode == 200) {
      return List<MoviesListModel>.from((response.data['results'] as List)
          .map((e) => MoviesListModel.fromjson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromjson(response.data));
    }
  }
}
