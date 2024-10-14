part of 'movie_list_bloc.dart';

class MovieListState extends Equatable {
  final List<MoviesList> popularMoviesList;
  final RequestState popularMoviesListState;
  final String popularMoviesListMessage;

  final List<MoviesList> topRatedMoviesList;
  final RequestState topRatedMoviesListState;
  final String topRatedMoviesListMessage;

  const MovieListState({
    this.popularMoviesList = const [],
    this.popularMoviesListState = RequestState.loading,
    this.popularMoviesListMessage = '',
    this.topRatedMoviesList = const [],
    this.topRatedMoviesListState = RequestState.loading,
    this.topRatedMoviesListMessage = '',
  });
  MovieListState copyWith({
    List<MoviesList>? popularMoviesList,
    RequestState? popularMoviesListState,
    String? popularMoviesListMessage,
    List<MoviesList>? topRatedMoviesList,
    RequestState? topRatedMoviesListState,
    String? topRatedMoviesListMessage,
  }) {
    return MovieListState(
      popularMoviesList: popularMoviesList ?? this.popularMoviesList,
      popularMoviesListState:
          popularMoviesListState ?? this.popularMoviesListState,
      popularMoviesListMessage:
          popularMoviesListMessage ?? this.popularMoviesListMessage,
      topRatedMoviesList: topRatedMoviesList ?? this.topRatedMoviesList,
      topRatedMoviesListState:
          topRatedMoviesListState ?? this.topRatedMoviesListState,
      topRatedMoviesListMessage:
          topRatedMoviesListMessage ?? this.topRatedMoviesListMessage,
    );
  }

  @override
  List<Object?> get props => [
        popularMoviesList,
        popularMoviesListState,
        popularMoviesListMessage,
        topRatedMoviesList,
        topRatedMoviesListState,
        topRatedMoviesListMessage,
      ];
}
