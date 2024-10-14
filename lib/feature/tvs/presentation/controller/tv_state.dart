part of 'tv_bloc.dart';

class TvState extends Equatable {
  final List<Tv> onAirTv;
  final RequestState onAirState;
  final String onAirMessage;

  final List<Tv> popularTv;
  final RequestState popularTvState;
  final String popularTvMessage;

  final List<Tv> topRatedTv;
  final RequestState topRatedTvState;
  final String topRatedTvMessage;

  const TvState({
    this.onAirTv = const [],
    this.onAirState = RequestState.loading,
    this.onAirMessage = '',
    this.popularTv = const [],
    this.popularTvState = RequestState.loading,
    this.popularTvMessage = '',
    this.topRatedTv = const [],
    this.topRatedTvState = RequestState.loading,
    this.topRatedTvMessage = '',
  });

  TvState copyWith({
    List<Tv>? onAirTv,
    RequestState? onAirState,
    String? onAirMessage,
    List<Tv>? popularTv,
    RequestState? popularTvState,
    String? popularTvMessage,
    List<Tv>? topRatedTv,
    RequestState? topRatedTvState,
    String? topRatedTvMessage,
  }) {
    return TvState(
      onAirTv: onAirTv ?? this.onAirTv,
      onAirState: onAirState ?? this.onAirState,
      onAirMessage: onAirMessage ?? this.onAirMessage,
      popularTv: popularTv ?? this.popularTv,
      popularTvState: popularTvState ?? this.popularTvState,
      popularTvMessage: popularTvMessage ?? this.popularTvMessage,
      topRatedTv: topRatedTv ?? this.topRatedTv,
      topRatedTvState: topRatedTvState ?? this.topRatedTvState,
      topRatedTvMessage: topRatedTvMessage ?? this.topRatedTvMessage,
    );
  }

  @override
  List<Object> get props => [
        onAirTv,
        onAirState,
        onAirMessage,
        popularTv,
        popularTvState,
        popularTvMessage,
        topRatedTv,
        topRatedTvState,
        topRatedTvMessage,
      ];
}
