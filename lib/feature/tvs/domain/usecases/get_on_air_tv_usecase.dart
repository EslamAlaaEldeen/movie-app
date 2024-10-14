import 'package:dartz/dartz.dart';
import 'package:moviesapp/core/error/failure.dart';
import 'package:moviesapp/core/usecases/base_usecase.dart';
import 'package:moviesapp/feature/tvs/domain/entities/tv.dart';
import 'package:moviesapp/feature/tvs/domain/repository/base_tv_repository.dart';

class GetOnAirUseCase extends BaseUseCase<List<Tv>, NoParameters> {
  final BaseTvRepository baseTvRepository;
  GetOnAirUseCase(this.baseTvRepository);

  @override
  Future<Either<Failure, List<Tv>>> call(NoParameters parameters) async {
    return await baseTvRepository.getOnAirTV();
  }
}
