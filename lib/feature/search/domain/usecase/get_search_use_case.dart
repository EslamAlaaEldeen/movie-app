import 'package:dartz/dartz.dart';
import 'package:moviesapp/core/Parameters/search_parameter.dart';
import 'package:moviesapp/core/error/failure.dart';
import 'package:moviesapp/core/usecases/base_usecase.dart';
import 'package:moviesapp/feature/search/domain/entities/search.dart';
import 'package:moviesapp/feature/search/domain/repository/base_search_repository.dart';

class SearchUseCase extends BaseUseCase<List<SearchEntity>, SearchParameter> {
  final BaseSearchRepository searchRepository;

  SearchUseCase(this.searchRepository);

  @override
  Future<Either<Failure, List<SearchEntity>>> call(
      SearchParameter parameters) async {
    return await searchRepository.getSearch(parameters);
  }
}
