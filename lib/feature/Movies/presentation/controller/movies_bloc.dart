import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:moviesapp/core/usecases/base_usecase.dart';
import 'package:moviesapp/core/utils/enum.dart';
import 'package:moviesapp/feature/Movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:moviesapp/feature/Movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:moviesapp/feature/Movies/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:moviesapp/feature/Movies/presentation/controller/movies_events.dart';
import 'package:moviesapp/feature/Movies/presentation/controller/movies_states.dart';

class MoviesBloc extends Bloc<MoviesEvents, MoviesState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;
  MoviesBloc(
    this.getNowPlayingMoviesUseCase,
    this.getPopularMoviesUseCase,
    this.getTopRatedMoviesUseCase,
  ) : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>(_nowPlayingMovies);
    on<GetPopularMoviesEvent>(_popularMovies);
    on<GetTopRatedMoviesEvent>(_topRatedMovies);
  }

  FutureOr<void> _nowPlayingMovies(
      GetNowPlayingMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getNowPlayingMoviesUseCase(const NoParameters());
    result.fold(
        (l) => emit(state.copyWith(
            nowPlayingState: RequestState.error, nowPlayingMessage: l.message)),
        (r) => emit(state.copyWith(
            nowPlayingState: RequestState.success, nowPlayingMovies: r)));
  }

  FutureOr<void> _popularMovies(
      GetPopularMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getPopularMoviesUseCase(const NoParameters());
    result.fold(
        (l) => emit(state.copyWith(
            popularMoviesState: RequestState.error,
            popularMoviesMessage: l.message)),
        (r) => emit(state.copyWith(
            popularMoviesState: RequestState.success, popularMovies: r)));
  }

  FutureOr<void> _topRatedMovies(
      GetTopRatedMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getTopRatedMoviesUseCase(const NoParameters());
    result.fold(
        (l) => emit(state.copyWith(
            topRatedMoviesState: RequestState.error,
            topRatedMoviesMessage: l.message)),
        (r) => emit(state.copyWith(
            topRatedMoviesState: RequestState.success, topRatedMovies: r)));
  }
}
