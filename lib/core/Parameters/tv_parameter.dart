import 'package:equatable/equatable.dart';

class TvDetailsParameter extends Equatable {
  final int tvId;

  const TvDetailsParameter({required this.tvId});

  @override
  List<Object> get props => [tvId];
}

class TvRecommendationParameter extends Equatable {
  final int id;

  const TvRecommendationParameter(this.id);

  @override
  List<Object> get props => [id];
}

class TvEpisodesParameter extends Equatable {
  final int tvId;
  final int seasonNumber;

  const TvEpisodesParameter(this.tvId, this.seasonNumber);

  @override
  List<Object> get props => [tvId, seasonNumber];
}
