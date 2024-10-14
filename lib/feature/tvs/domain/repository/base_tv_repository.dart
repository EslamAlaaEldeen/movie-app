import 'package:dartz/dartz.dart';
import 'package:moviesapp/core/Parameters/tv_parameter.dart';
import 'package:moviesapp/core/error/failure.dart';
import 'package:moviesapp/feature/tvs/domain/entities/Tv_Recommendation.dart';
import 'package:moviesapp/feature/tvs/domain/entities/tv.dart';
import 'package:moviesapp/feature/tvs/domain/entities/tv_details.dart';
import 'package:moviesapp/feature/tvs/domain/entities/tv_episodes.dart';

abstract class BaseTvRepository {
  Future<Either<Failure, List<Tv>>> getOnAirTV();
  Future<Either<Failure, List<Tv>>> getPopularTV();
  Future<Either<Failure, List<Tv>>> getTopRatedTV();
  Future<Either<Failure, List<Tv>>> getPopularTVList();
  Future<Either<Failure, List<Tv>>> getTopRatedTVList();
  Future<Either<Failure, TvDetails>> getTvDetails(
      TvDetailsParameter parameters);

  Future<Either<Failure, List<TvRecommendation>>> getTvRecommendation(
      TvRecommendationParameter parameters);
  Future<Either<Failure, List<TvEpisodes>>> getTvEpisodes(
      TvEpisodesParameter parameter);
}
