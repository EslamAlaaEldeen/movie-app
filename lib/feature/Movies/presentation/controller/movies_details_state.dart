part of 'movies_details_bloc.dart';

class MoviesDetailsState extends Equatable {
  const MoviesDetailsState(
      {this.movieDetails,
      this.movieDetailsState = RequestState.loading,
      this.movieDetailsMessage = '',
      this.recommendation = const [],
      this.recommendationsState = RequestState.loading,
      this.recommendationsMessage = ''});

  final MovieDetails? movieDetails;
  final RequestState movieDetailsState;
  final String movieDetailsMessage;

  final List<Recommendation> recommendation;
  final RequestState recommendationsState;
  final String recommendationsMessage;

  MoviesDetailsState copyWith({
    MovieDetails? movieDetails,
    RequestState? movieDetailsState,
    String? movieDetailsMessage,
    List<Recommendation>? recommendation,
    RequestState? recommendationsState,
    String? recommendationsMessage,
  }) {
    return MoviesDetailsState(
        movieDetails: movieDetails ?? this.movieDetails,
        movieDetailsState: movieDetailsState ?? this.movieDetailsState,
        movieDetailsMessage: movieDetailsMessage ?? this.movieDetailsMessage,
        recommendation: recommendation ?? this.recommendation,
        recommendationsState: recommendationsState ?? this.recommendationsState,
        recommendationsMessage:
            recommendationsMessage ?? this.recommendationsMessage);
  }

  @override
  List<Object?> get props => [
        movieDetails,
        movieDetailsState,
        movieDetailsMessage,
        recommendation,
        recommendationsState,
        recommendationsMessage
      ];
}
