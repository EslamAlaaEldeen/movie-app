import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:moviesapp/core/usecases/base_usecase.dart';
import 'package:moviesapp/core/utils/enum.dart';
import 'package:moviesapp/feature/tvs/domain/entities/tv.dart';
import 'package:moviesapp/feature/tvs/domain/usecases/get_on_air_tv_usecase.dart';
import 'package:moviesapp/feature/tvs/domain/usecases/get_popular_tv_usecase.dart';
import 'package:moviesapp/feature/tvs/domain/usecases/get_top_rated_tv_use_case.dart';

part 'tv_event.dart';
part 'tv_state.dart';

class TvBloc extends Bloc<TvEvent, TvState> {
  final GetOnAirUseCase getOnAirUseCase;
  final GetPopularTvUseCase getPopularTvUseCase;
  final GetTopRatedTvUseCase getTopRatedTvUseCase;

  TvBloc(
      this.getOnAirUseCase, this.getPopularTvUseCase, this.getTopRatedTvUseCase)
      : super(const TvState()) {
    on<GetOnAirTvEvent>(_getOnAirTv);
    on<GetPopularTvEvent>(_getPopularTv);
    on<GetTopRatedTvEvent>(_geTopRatedTv);
  }

  FutureOr<void> _getOnAirTv(
      GetOnAirTvEvent event, Emitter<TvState> emit) async {
    final result = await getOnAirUseCase(const NoParameters());
    result.fold(
        (l) => emit(state.copyWith(
            onAirState: RequestState.error, onAirMessage: l.message)),
        (r) =>
            emit(state.copyWith(onAirState: RequestState.success, onAirTv: r)));
  }

  FutureOr<void> _getPopularTv(
      GetPopularTvEvent event, Emitter<TvState> emit) async {
    final result = await getPopularTvUseCase(const NoParameters());
    result.fold(
        (l) => emit(state.copyWith(
            popularTvState: RequestState.error, popularTvMessage: l.message)),
        (r) => emit(state.copyWith(
            popularTvState: RequestState.success, popularTv: r)));
  }

  FutureOr<void> _geTopRatedTv(
      GetTopRatedTvEvent event, Emitter<TvState> emit) async {
    final result = await getTopRatedTvUseCase(const NoParameters());
    result.fold(
        (l) => emit(state.copyWith(
            topRatedTvState: RequestState.error, topRatedTvMessage: l.message)),
        (r) => emit(state.copyWith(
            topRatedTvState: RequestState.success, topRatedTv: r)));
  }
}
