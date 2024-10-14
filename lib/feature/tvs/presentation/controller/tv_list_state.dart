part of 'tv_list_bloc.dart';

class TvListState extends Equatable {
  final List<Tv> popularTvList;
  final RequestState popularTvListState;
  final String popularTvListMessage;

  final List<Tv> topRatedTvList;
  final RequestState topRatedTvListState;
  final String topRatedTvListMessage;

  const TvListState(
      {this.popularTvList = const [],
      this.popularTvListState = RequestState.loading,
      this.popularTvListMessage = '',
      this.topRatedTvList = const [],
      this.topRatedTvListState = RequestState.loading,
      this.topRatedTvListMessage = ''});
  TvListState copyWith({
    List<Tv>? popularTvList,
    RequestState? popularTvListState,
    String? popularTvListMessage,
    List<Tv>? topRatedTvList,
    RequestState? topRatedTvListState,
    String? topRatedTvListMessage,
  }) {
    return TvListState(
      popularTvList: popularTvList ?? this.popularTvList,
      popularTvListState: popularTvListState ?? this.popularTvListState,
      popularTvListMessage: popularTvListMessage ?? this.popularTvListMessage,
      topRatedTvList: topRatedTvList ?? this.topRatedTvList,
      topRatedTvListState: topRatedTvListState ?? this.topRatedTvListState,
      topRatedTvListMessage:
          topRatedTvListMessage ?? this.topRatedTvListMessage,
    );
  }

  @override
  List<Object> get props => [
        popularTvList,
        popularTvListState,
        popularTvListMessage,
        topRatedTvList,
        topRatedTvListState,
        topRatedTvListMessage,
      ];
}
