import 'package:dio/dio.dart';
import 'package:moviesapp/core/Parameters/tv_parameter.dart';
import 'package:moviesapp/core/error/exceptions.dart';
import 'package:moviesapp/core/network/api_constance.dart';
import 'package:moviesapp/core/network/error_messages.dart';
import 'package:moviesapp/feature/tvs/data/models/Tv_Recommendation_model.dart';
import 'package:moviesapp/feature/tvs/data/models/tv_details_model.dart';
import 'package:moviesapp/feature/tvs/data/models/tv_episodes_model.dart';
import 'package:moviesapp/feature/tvs/data/models/tv_model.dart';

abstract class BaseTvRemoteDataSource {
  Future<List<TvModel>> getOnAirTv();

  Future<List<TvModel>> getPopularTv();

  Future<List<TvModel>> getTopRatedTv();

  Future<List<TvModel>> getPopularTvList();

  Future<List<TvModel>> getTopRatedTvList();

  Future<TvDetailsModel> getTvDetails(TvDetailsParameter parameters);

  Future<List<TvRecommendationModel>> getTvRecommendation(
      TvRecommendationParameter parameters);

  Future<List<TvEpisodesModel>> getTvEpisodes(TvEpisodesParameter parameters);
}

class TvRemoteDataSource extends BaseTvRemoteDataSource {
  @override
  Future<List<TvModel>> getOnAirTv() async {
    final response = await Dio().get(ApiConstance.onAirTvPath);
    if (response.statusCode == 200) {
      return List<TvModel>.from(
          (response.data['results'] as List).map((e) => TvModel.fromjson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromjson(response.data));
    }
  }

  @override
  Future<List<TvModel>> getPopularTv() async {
    final response = await Dio().get(ApiConstance.popularTvPath);
    if (response.statusCode == 200) {
      return List<TvModel>.from(
          (response.data['results'] as List).map((e) => TvModel.fromjson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromjson(response.data));
    }
  }

  @override
  Future<List<TvModel>> getTopRatedTv() async {
    final response = await Dio().get(ApiConstance.topRatedTvPath);
    if (response.statusCode == 200) {
      return List<TvModel>.from(
          (response.data['results'] as List).map((e) => TvModel.fromjson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromjson(response.data));
    }
  }

  @override
  Future<List<TvModel>> getPopularTvList() async {
    final response = await Dio().get(ApiConstance.popularTvPath);
    if (response.statusCode == 200) {
      return List<TvModel>.from(
          (response.data['results'] as List).map((e) => TvModel.fromjson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromjson(response.data));
    }
  }

  @override
  Future<List<TvModel>> getTopRatedTvList() async {
    final response = await Dio().get(ApiConstance.topRatedTvPath);
    if (response.statusCode == 200) {
      return List<TvModel>.from(
          (response.data['results'] as List).map((e) => TvModel.fromjson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromjson(response.data));
    }
  }

  @override
  Future<TvDetailsModel> getTvDetails(TvDetailsParameter parameters) async {
    final response =
        await Dio().get(ApiConstance.tvDetailsPath(parameters.tvId));
    if (response.statusCode == 200) {
      return TvDetailsModel.fromjson(response.data);
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromjson(response.data));
    }
  }

  @override
  Future<List<TvRecommendationModel>> getTvRecommendation(
      TvRecommendationParameter parameters) async {
    final response =
        await Dio().get(ApiConstance.recommendationTvPath(parameters.id));
    if (response.statusCode == 200) {
      return List<TvRecommendationModel>.from((response.data['results'] as List)
          .map((e) => TvRecommendationModel.fromjson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromjson(response.data));
    }
  }

  @override
  Future<List<TvEpisodesModel>> getTvEpisodes(
      TvEpisodesParameter parameters) async {
    final response = await Dio().get(
        ApiConstance.episodeTvPath(parameters.tvId, parameters.seasonNumber));
    if (response.statusCode == 200) {
      return List<TvEpisodesModel>.from(
          (response.data['episodes']).map((e) => TvEpisodesModel.fromjson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromjson(response.data));
    }
  }
}
