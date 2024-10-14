import 'package:dartz/dartz.dart';

import 'package:moviesapp/core/error/failure.dart';
import 'package:moviesapp/core/usecases/base_usecase.dart';
import 'package:moviesapp/feature/Movies/domain/entities/movie.dart';
import 'package:moviesapp/feature/Movies/domain/repository/base_movie_repository.dart';

class GetNowPlayingMoviesUseCase
    extends BaseUseCase<List<Movie>, NoParameters> {
  final BaseMovieRepository baseMovieRepository;

  GetNowPlayingMoviesUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParameters parameters) async {
    return await baseMovieRepository.getNowPlayingMovies();
  }
}
