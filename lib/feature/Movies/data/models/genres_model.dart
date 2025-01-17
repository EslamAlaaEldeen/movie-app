import 'package:moviesapp/feature/Movies/domain/entities/genres.dart';

class GenresModel extends Genres {
  const GenresModel({required super.id, required super.name});
  factory GenresModel.fromjson(Map<String, dynamic> json) =>
      GenresModel(id: json['id'], name: json['name']);
}
