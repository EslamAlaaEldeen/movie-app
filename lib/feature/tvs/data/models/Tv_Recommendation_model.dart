import 'package:moviesapp/feature/tvs/domain/entities/Tv_Recommendation.dart';

class TvRecommendationModel extends TvRecommendation {
  const TvRecommendationModel({required super.id, required super.poster});
  factory TvRecommendationModel.fromjson(Map<String, dynamic> json) =>
      TvRecommendationModel(id: json['id'], poster: json['poster_path']);
}
