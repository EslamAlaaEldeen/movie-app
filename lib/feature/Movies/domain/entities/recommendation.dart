import 'package:equatable/equatable.dart';

class Recommendation extends Equatable {
  final String? backDropPath;
  final int id;

  const Recommendation({required this.id, this.backDropPath});

  @override
  List<Object?> get props => [backDropPath, id];
}
