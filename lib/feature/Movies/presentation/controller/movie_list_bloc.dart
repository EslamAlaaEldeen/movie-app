import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:moviesapp/core/usecases/base_usecase.dart';
import 'package:moviesapp/core/utils/enum.dart';
import 'package:moviesapp/feature/Movies/domain/entities/movies_list.dart';
import 'package:moviesapp/feature/Movies/domain/usecases/get_popular_movies_list_usecase.dart';
import 'package:moviesapp/feature/Movies/domain/usecases/get_top_rated_move_list_usecase.dart';

part 'movie_list_event.dart';
part 'movie_list_state.dart';

class MovieListBloc extends Bloc<MovieListEvent, MovieListState> {
  final GetPopularMoviesListUseCase getPopularMoviesListUseCase;
  final GetTopRatedMoviesListUseCase getTopRatedMoviesListUseCase;
  MovieListBloc(
    this.getPopularMoviesListUseCase,
    this.getTopRatedMoviesListUseCase,
  ) : super(const MovieListState()) {
    on<GetPopularMoviesListEvent>(_popularMoviesList);
    on<GetTopRatedMoviesListEvent>(_TopRatedMoviesList);
  }

  FutureOr<void> _popularMoviesList(
      GetPopularMoviesListEvent event, Emitter<MovieListState> emit) async {
    final result = await getPopularMoviesListUseCase(const NoParameters());
    result.fold(
        (l) => emit(state.copyWith(
            popularMoviesListState: RequestState.error,
            popularMoviesListMessage: l.message)),
        (r) => emit(state.copyWith(
            popularMoviesListState: RequestState.success,
            popularMoviesList: r)));
  }

  FutureOr<void> _TopRatedMoviesList(
      GetTopRatedMoviesListEvent event, Emitter<MovieListState> emit) async {
    final result = await getTopRatedMoviesListUseCase(const NoParameters());
    result.fold(
        (l) => emit(state.copyWith(
            topRatedMoviesListState: RequestState.error,
            topRatedMoviesListMessage: l.message)),
        (r) => emit(state.copyWith(
            topRatedMoviesListState: RequestState.success,
            topRatedMoviesList: r)));
  }
}
