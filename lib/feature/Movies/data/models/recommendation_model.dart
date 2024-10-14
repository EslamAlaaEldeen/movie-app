import 'package:moviesapp/feature/Movies/domain/entities/recommendation.dart';

class RecommendationModel extends Recommendation {
  const RecommendationModel({required super.id, super.backDropPath});

  factory RecommendationModel.fromjson(Map<String, dynamic> json) =>
      RecommendationModel(
          id: json['id'],
          backDropPath: json['poster_path'] ??
              'https://th.bing.com/th/id/OIP.hkQjNSSwkb3sXV34-Lp5OwAAAA?w=224&h=300&rs=1&pid=ImgDetMain');
}
