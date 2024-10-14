import 'package:equatable/equatable.dart';

class TvEpisodes extends Equatable {
  final int id;
  final int seasons;
  final String poster;
  final String name;
  final String releaseDate;
  final String overView;
  final int seasonNumber;

  const TvEpisodes(
      {required this.id,
      required this.seasons,
      required this.poster,
      required this.name,
      required this.releaseDate,
      required this.overView,
      required this.seasonNumber});

  @override
  List<Object> get props => [
        id,
        seasons,
        poster,
        name,
        releaseDate,
        overView,
        seasonNumber,
      ];
}
