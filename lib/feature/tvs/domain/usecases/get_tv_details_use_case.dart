import 'package:dartz/dartz.dart';
import 'package:moviesapp/core/Parameters/tv_parameter.dart';
import 'package:moviesapp/core/error/failure.dart';
import 'package:moviesapp/core/usecases/base_usecase.dart';
import 'package:moviesapp/feature/tvs/domain/entities/tv_details.dart';
import 'package:moviesapp/feature/tvs/domain/repository/base_tv_repository.dart';

class GetTvDetailsUseCase extends BaseUseCase<TvDetails, TvDetailsParameter> {
  final BaseTvRepository baseTvRepository;

  GetTvDetailsUseCase(this.baseTvRepository);

  @override
  Future<Either<Failure, TvDetails>> call(TvDetailsParameter parameters) async {
    return await baseTvRepository.getTvDetails(parameters);
  }
}
