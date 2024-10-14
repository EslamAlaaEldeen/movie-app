import 'package:dartz/dartz.dart';

import 'package:moviesapp/core/error/failure.dart';
import 'package:moviesapp/core/usecases/base_usecase.dart';
import 'package:moviesapp/feature/Movies/domain/entities/movies_list.dart';
import 'package:moviesapp/feature/Movies/domain/repository/base_movie_repository.dart';

class GetPopularMoviesListUseCase
    extends BaseUseCase<List<MoviesList>, NoParameters> {
  final BaseMovieRepository baseMovieRepository;

  GetPopularMoviesListUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure, List<MoviesList>>> call(
      NoParameters parameters) async {
    return await baseMovieRepository.getPopularMoviesList();
  }
}
