import 'package:dio/dio.dart';
import 'package:moviesapp/core/Parameters/search_parameter.dart';
import 'package:moviesapp/core/error/exceptions.dart';
import 'package:moviesapp/core/network/api_constance.dart';
import 'package:moviesapp/core/network/error_messages.dart';
import 'package:moviesapp/feature/search/data/models/search_Model.dart';
import 'package:moviesapp/feature/search/domain/entities/search.dart';

abstract class BaseSearchRemoteDataSource {
  Future<List<SearchEntity>> getSearch(SearchParameter parameters);
}

class SearchRemoteDatasource extends BaseSearchRemoteDataSource {
  @override
  Future<List<SearchEntity>> getSearch(SearchParameter parameters) async {
    final response = await Dio().get(ApiConstance.searchPath(parameters.query));
    if (response.statusCode == 200) {
      return List<SearchModel>.from((response.data['results'] as List)
          .map((e) => SearchModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromjson(response.data));
    }
  }
}
