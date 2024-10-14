import 'package:equatable/equatable.dart';

class SearchEntity extends Equatable {
  final int id;
  final String posterPath;
  final String title;
  final String releaseDate;
  final String mediaType;

  const SearchEntity(
      {required this.id,
      required this.posterPath,
      required this.title,
      required this.releaseDate,
      required this.mediaType});

  @override
  @override
  List<Object> get props => [id, title, releaseDate, posterPath, mediaType];
}
