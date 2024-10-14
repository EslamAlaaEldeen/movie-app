import 'package:dartz/dartz.dart';
import 'package:moviesapp/core/error/failure.dart';
import 'package:moviesapp/core/usecases/base_usecase.dart';
import 'package:moviesapp/feature/tvs/domain/repository/base_tv_repository.dart';

import '../entities/tv.dart';

class GetPopularTvUseCase extends BaseUseCase<List<Tv>, NoParameters> {
  final BaseTvRepository baseTvRepository;
  GetPopularTvUseCase(this.baseTvRepository);
  @override
  Future<Either<Failure, List<Tv>>> call(NoParameters parameters) async {
    return await baseTvRepository.getPopularTV();
  }
}
