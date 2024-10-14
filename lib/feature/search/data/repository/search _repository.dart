import 'package:dartz/dartz.dart';
import 'package:moviesapp/core/Parameters/search_parameter.dart';
import 'package:moviesapp/core/error/exceptions.dart';
import 'package:moviesapp/core/error/failure.dart';
import 'package:moviesapp/feature/search/data/data_source/search_remote_data_source.dart';
import 'package:moviesapp/feature/search/domain/entities/search.dart';
import 'package:moviesapp/feature/search/domain/repository/base_search_repository.dart';

class SearchRepository extends BaseSearchRepository {
  final BaseSearchRemoteDataSource remoteDataSource;

  SearchRepository(this.remoteDataSource);

  @override
  Future<Either<Failure, List<SearchEntity>>> getSearch(
      SearchParameter parameters) async {
    final result = await remoteDataSource.getSearch(parameters);
    try {
      return right(result);
    } on ServerException catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
