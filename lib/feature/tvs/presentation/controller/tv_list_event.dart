part of 'tv_list_bloc.dart';

abstract class TvListEvent extends Equatable {
  const TvListEvent();

  @override
  List<Object> get props => [];
}

class GetPopularTvListEvent extends TvListEvent {}

class GetTopRatedTvListEvent extends TvListEvent {}
