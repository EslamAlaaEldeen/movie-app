part of 'tv_details_bloc.dart';

class TvDetailsState extends Equatable {
  final TvDetails? tvDetails;
  final RequestState tvDetailsState;
  final String tvDetailsMessage;

  final List<TvEpisodes> tvEpisodes;
  final RequestState tvEpisodesState;
  final String tvEpisodesMessage;

  final List<TvRecommendation> tvRecommendation;
  final RequestState tvRecommendationState;
  final String tvRecommendationMessage;

  final int currentPageIndex;

  const TvDetailsState({
    this.tvDetails,
    this.tvDetailsState = RequestState.loading,
    this.tvDetailsMessage = '',
    this.tvEpisodes = const [],
    this.tvEpisodesState = RequestState.loading,
    this.tvEpisodesMessage = '',
    this.tvRecommendation = const [],
    this.tvRecommendationState = RequestState.loading,
    this.tvRecommendationMessage = '',
    this.currentPageIndex = 0,
  });

  TvDetailsState copyWith({
    TvDetails? tvDetails,
    RequestState? tvDetailsState,
    String? tvDetailsMessage,
    List<TvEpisodes>? tvEpisodes,
    RequestState? tvEpisodesState,
    String? tvEpisodesMessage,
    List<TvRecommendation>? tvRecommendation,
    RequestState? tvRecommendationState,
    String? tvRecommendationMessage,
    int? currentPageIndex,
  }) {
    return TvDetailsState(
      tvDetails: tvDetails ?? this.tvDetails,
      tvDetailsState: tvDetailsState ?? this.tvDetailsState,
      tvDetailsMessage: tvDetailsMessage ?? this.tvDetailsMessage,
      tvEpisodes: tvEpisodes ?? this.tvEpisodes,
      tvEpisodesState: tvEpisodesState ?? this.tvEpisodesState,
      tvEpisodesMessage: tvEpisodesMessage ?? this.tvEpisodesMessage,
      tvRecommendation: tvRecommendation ?? this.tvRecommendation,
      tvRecommendationState:
          tvRecommendationState ?? this.tvRecommendationState,
      tvRecommendationMessage:
          tvRecommendationMessage ?? this.tvRecommendationMessage,
      currentPageIndex: currentPageIndex ?? this.currentPageIndex,
    );
  }

  @override
  List<Object?> get props => [
        tvDetails,
        tvDetailsState,
        tvDetailsMessage,
        tvEpisodes,
        tvEpisodesState,
        tvEpisodesMessage,
        tvRecommendation,
        tvRecommendationState,
        tvRecommendationMessage,
        currentPageIndex,
      ];
}
