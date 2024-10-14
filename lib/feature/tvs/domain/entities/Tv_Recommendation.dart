import 'package:equatable/equatable.dart';

class TvRecommendation extends Equatable {
  final int id;
  final String poster;

  const TvRecommendation({required this.id, required this.poster});

  @override
  List<Object> get props => [id, poster];
}
