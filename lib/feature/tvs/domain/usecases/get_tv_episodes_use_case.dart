import 'package:dartz/dartz.dart';
import 'package:moviesapp/core/Parameters/tv_parameter.dart';
import 'package:moviesapp/core/error/failure.dart';
import 'package:moviesapp/core/usecases/base_usecase.dart';
import 'package:moviesapp/feature/tvs/domain/entities/tv_episodes.dart';
import 'package:moviesapp/feature/tvs/domain/repository/base_tv_repository.dart';

class GetTvEpisodesUseCase
    extends BaseUseCase<List<TvEpisodes>, TvEpisodesParameter> {
  final BaseTvRepository baseTvRepository;
  GetTvEpisodesUseCase(this.baseTvRepository);

  @override
  Future<Either<Failure, List<TvEpisodes>>> call(
      TvEpisodesParameter parameters) async {
    return await baseTvRepository.getTvEpisodes(parameters);
  }
}
