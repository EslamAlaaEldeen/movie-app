import 'package:moviesapp/feature/search/domain/entities/search.dart';

class SearchModel extends SearchEntity {
  const SearchModel(
      {required super.id,
      required super.title,
      required super.releaseDate,
      required super.posterPath,
      required super.mediaType});

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? json['name'] ?? 'Unknown Title',
      releaseDate:
          json['release_date'] ?? json['first_air_date'] ?? 'Unknown Date',
      posterPath: json['poster_path'] ?? json['backdrop_path'] ?? '',
      mediaType: json['media_type'] ?? 'unknown');
}
