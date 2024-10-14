import 'package:dartz/dartz.dart';
import 'package:moviesapp/core/Parameters/search_parameter.dart';
import 'package:moviesapp/core/error/failure.dart';
import 'package:moviesapp/feature/search/domain/entities/search.dart';

abstract class BaseSearchRepository {
  Future<Either<Failure, List<SearchEntity>>> getSearch(
      SearchParameter parameters);
}
