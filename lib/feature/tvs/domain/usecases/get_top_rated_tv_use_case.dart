import 'package:dartz/dartz.dart';
import 'package:moviesapp/core/error/failure.dart';
import 'package:moviesapp/core/usecases/base_usecase.dart';

import '../entities/tv.dart';
import '../repository/base_tv_repository.dart';

class GetTopRatedTvUseCase extends BaseUseCase<List<Tv>, NoParameters> {
  final BaseTvRepository baseTvRepository;
  GetTopRatedTvUseCase(this.baseTvRepository);
  @override
  Future<Either<Failure, List<Tv>>> call(NoParameters parameters) async {
    return await baseTvRepository.getTopRatedTV();
  }
}
