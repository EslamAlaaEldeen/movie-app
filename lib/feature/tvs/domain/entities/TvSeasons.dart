import 'package:equatable/equatable.dart';

class TvSeasons extends Equatable {
  final int seasonNumber;

  const TvSeasons({required this.seasonNumber});

  @override
  List<Object> get props => [seasonNumber];
}
