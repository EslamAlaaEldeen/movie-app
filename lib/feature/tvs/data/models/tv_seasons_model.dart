import 'package:moviesapp/feature/tvs/domain/entities/TvSeasons.dart';

class TvSeasonsModel extends TvSeasons {
  const TvSeasonsModel({required super.seasonNumber});

  factory TvSeasonsModel.fromJson(Map<String, dynamic> json) =>
      TvSeasonsModel(seasonNumber: json['season_number']);
}
