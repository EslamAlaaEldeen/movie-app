part of 'movie_list_bloc.dart';

abstract class MovieListEvent extends Equatable {
  const MovieListEvent();

  @override
  List<Object?> get props => [];

}

class GetPopularMoviesListEvent extends MovieListEvent {}

class GetTopRatedMoviesListEvent extends MovieListEvent {}