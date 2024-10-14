import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:moviesapp/core/Parameters/movie_parameter.dart';
import 'package:moviesapp/core/utils/enum.dart';
import 'package:moviesapp/feature/Movies/domain/entities/Movie_details.dart';
import 'package:moviesapp/feature/Movies/domain/entities/recommendation.dart';
import 'package:moviesapp/feature/Movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:moviesapp/feature/Movies/domain/usecases/get_recommendation_usecase.dart';

part 'movies_details_event.dart';
part 'movies_details_state.dart';

class MoviesDetailsBloc extends Bloc<MoviesDetailsEvent, MoviesDetailsState> {
  MoviesDetailsBloc(this.getMovieDetailsUseCase, this.getRecommendationUseCase)
      : super(const MoviesDetailsState()) {
    on<GetMovieDetailsEvent>(_getMoviesDetails);
    on<GetMovieRecommendationEvent>(_getRecommendation);
  }

  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final GetRecommendationUseCase getRecommendationUseCase;
  FutureOr<void> _getMoviesDetails(
      GetMovieDetailsEvent event, Emitter<MoviesDetailsState> emit) async {
    final result =
        await getMovieDetailsUseCase(MovieDetailsParameters(movieId: event.id));
    result.fold(
        (l) => emit(
              state.copyWith(
                  movieDetailsState: RequestState.error,
                  movieDetailsMessage: l.message),
            ),
        (r) => emit(state.copyWith(
            movieDetailsState: RequestState.success, movieDetails: r)));
  }

  FutureOr<void> _getRecommendation(GetMovieRecommendationEvent event,
      Emitter<MoviesDetailsState> emit) async {
    final result =
        await getRecommendationUseCase(RecommendationParameters(event.id));

    result.fold(
        (l) => emit(
              state.copyWith(
                  recommendationsState: RequestState.error,
                  recommendationsMessage: l.message),
            ),
        (r) => emit(state.copyWith(
            recommendationsState: RequestState.success, recommendation: r)));
  }
}
