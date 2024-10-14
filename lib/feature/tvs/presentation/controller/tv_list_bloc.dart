import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:moviesapp/core/usecases/base_usecase.dart';
import 'package:moviesapp/core/utils/enum.dart';
import 'package:moviesapp/feature/tvs/domain/entities/tv.dart';
import 'package:moviesapp/feature/tvs/domain/usecases/get_popular_tv_list_usecase.dart';
import 'package:moviesapp/feature/tvs/domain/usecases/get_top_rated_tv_list_use-case.dart';

part 'tv_list_event.dart';
part 'tv_list_state.dart';

class TvListBloc extends Bloc<TvListEvent, TvListState> {
  final GetPopularTvListUseCase getPopularTvListUseCase;
  final GetTopRatedTvListUseCase getTopRatedTvListUseCase;
  TvListBloc(this.getPopularTvListUseCase, this.getTopRatedTvListUseCase)
      : super(const TvListState()) {
    on<GetPopularTvListEvent>(_getPopularTvList);
    on<GetTopRatedTvListEvent>(_getTopRatedTvList);
  }

  FutureOr<void> _getPopularTvList(
      GetPopularTvListEvent event, Emitter<TvListState> emit) async {
    final result = await getPopularTvListUseCase(const NoParameters());
    result.fold(
        (l) => emit(state.copyWith(
            popularTvListState: RequestState.error,
            popularTvListMessage: l.message)),
        (r) => emit(state.copyWith(
            popularTvListState: RequestState.success, popularTvList: r)));
  }

  FutureOr<void> _getTopRatedTvList(
      GetTopRatedTvListEvent event, Emitter<TvListState> emit) async {
    final result = await getTopRatedTvListUseCase(const NoParameters());
    result.fold(
        (l) => emit(state.copyWith(
            topRatedTvListState: RequestState.error,
            topRatedTvListMessage: l.message)),
        (r) => emit(state.copyWith(
            topRatedTvListState: RequestState.success, topRatedTvList: r)));
  }
}
