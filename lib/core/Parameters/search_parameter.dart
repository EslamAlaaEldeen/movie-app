import 'package:equatable/equatable.dart';

class SearchParameter extends Equatable {
  final String query;

  const SearchParameter({required this.query});

  @override
  List<Object> get props => [query];
}
