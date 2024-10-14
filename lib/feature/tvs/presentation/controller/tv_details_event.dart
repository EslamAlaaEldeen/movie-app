part of 'tv_details_bloc.dart';

abstract class TvDetailsEvent extends Equatable {
  const TvDetailsEvent();
}

class GetTvDetailsEvent extends TvDetailsEvent {
  final int id;

  const GetTvDetailsEvent(this.id);

  @override
  List<Object> get props => [id];
}

class GetTvEpisodesEvent extends TvDetailsEvent {
  final int id;
  final int seasonNumber;

  const GetTvEpisodesEvent(this.id, this.seasonNumber);

  @override
  List<Object> get props => [id, seasonNumber];
}

class GetTvRecommendationEvent extends TvDetailsEvent {
  final int id;

  const GetTvRecommendationEvent(this.id);

  @override
  List<Object> get props => [id];
}

class PageChangedEvent extends TvDetailsEvent {
  final int pageIndex;

  const PageChangedEvent(this.pageIndex);

  @override
  List<Object?> get props => [pageIndex];
}
