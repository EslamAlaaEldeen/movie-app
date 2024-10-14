import 'package:moviesapp/feature/tvs/domain/entities/tv_episodes.dart';

class TvEpisodesModel extends TvEpisodes {
  const TvEpisodesModel(
      {required super.id,
      required super.seasons,
      required super.poster,
      required super.name,
      required super.releaseDate,
      required super.overView,
      required super.seasonNumber});

  factory TvEpisodesModel.fromjson(Map<String, dynamic> json) =>
      TvEpisodesModel(
          id: json['id'],
          seasons: json['season_number'],
          poster: json['still_path'] ?? '',
          name: json['name'] ?? 'Unknown',
          releaseDate: json['air_date'] ?? '',
          overView: json['overview'],
          seasonNumber: json['season_number']);
}
