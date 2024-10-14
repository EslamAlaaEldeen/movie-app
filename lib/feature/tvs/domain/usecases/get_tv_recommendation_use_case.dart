import 'package:dartz/dartz.dart';
import 'package:moviesapp/core/Parameters/tv_parameter.dart';
import 'package:moviesapp/core/error/failure.dart';
import 'package:moviesapp/core/usecases/base_usecase.dart';
import 'package:moviesapp/feature/tvs/domain/entities/Tv_Recommendation.dart';
import 'package:moviesapp/feature/tvs/domain/repository/base_tv_repository.dart';

class GetTvRecommendationUseCase
    extends BaseUseCase<List<TvRecommendation>, TvRecommendationParameter> {
  final BaseTvRepository baseTvRepository;
  GetTvRecommendationUseCase(this.baseTvRepository);

  @override
  Future<Either<Failure, List<TvRecommendation>>> call(
      TvRecommendationParameter parameters) async {
    return await baseTvRepository.getTvRecommendation(parameters);
  }
}
