import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:moviesapp/core/Parameters/search_parameter.dart';
import 'package:moviesapp/core/utils/enum.dart';
import 'package:moviesapp/feature/search/domain/entities/search.dart';
import 'package:moviesapp/feature/search/domain/usecase/get_search_use_case.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchUseCase searchUseCase;

  SearchBloc(this.searchUseCase) : super(const SearchState()) {
    on<GetSearchEvent>(_getSearch);
  }

  FutureOr<void> _getSearch(
      GetSearchEvent event, Emitter<SearchState> emit) async {
    print('Search query: ${event.query}');
    final result = await searchUseCase(SearchParameter(query: event.query));
    result.fold((l) {
      emit(state.copyWith(
          searchState: RequestState.error, searchMessage: l.message));
    }, (r) {
      emit(state.copyWith(searchState: RequestState.success, search: r));
    });
  }
}
