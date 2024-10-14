import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:moviesapp/core/Parameters/tv_parameter.dart';
import 'package:moviesapp/core/error/exceptions.dart';
import 'package:moviesapp/core/error/failure.dart';
import 'package:moviesapp/feature/tvs/data/datasource/tv_remote_data_source.dart';
import 'package:moviesapp/feature/tvs/domain/entities/Tv_Recommendation.dart';
import 'package:moviesapp/feature/tvs/domain/entities/tv.dart';
import 'package:moviesapp/feature/tvs/domain/entities/tv_details.dart';
import 'package:moviesapp/feature/tvs/domain/entities/tv_episodes.dart';
import 'package:moviesapp/feature/tvs/domain/repository/base_tv_repository.dart';

class TvRepository extends BaseTvRepository {
  final BaseTvRemoteDataSource baseTvRemoteDataSource;
  TvRepository(this.baseTvRemoteDataSource);
  @override
  Future<Either<Failure, List<Tv>>> getOnAirTV() async {
    final result = await baseTvRemoteDataSource.getOnAirTv();
    try {
      return right(result);
    } on ServerException catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Tv>>> getPopularTV() async {
    final result = await baseTvRemoteDataSource.getPopularTv();
    try {
      return right(result);
    } on ServerException catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Tv>>> getTopRatedTV() async {
    final result = await baseTvRemoteDataSource.getTopRatedTv();
    try {
      return right(result);
    } on ServerException catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Tv>>> getPopularTVList() async {
    final result = await baseTvRemoteDataSource.getPopularTvList();
    try {
      return right(result);
    } on ServerException catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Tv>>> getTopRatedTVList() async {
    final result = await baseTvRemoteDataSource.getTopRatedTvList();
    try {
      return right(result);
    } on ServerException catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, TvDetails>> getTvDetails(
      TvDetailsParameter parameters) async {
    final result = await baseTvRemoteDataSource.getTvDetails(parameters);
    try {
      return right(result);
    } on ServerException catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<TvEpisodes>>> getTvEpisodes(
      TvEpisodesParameter parameter) async {
    final result = await baseTvRemoteDataSource.getTvEpisodes(parameter);
    try {
      return right(result);
    } on ServerException catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<TvRecommendation>>> getTvRecommendation(
      TvRecommendationParameter parameters) async {
    final result = await baseTvRemoteDataSource.getTvRecommendation(parameters);
    try {
      return right(result);
    } on ServerException catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
