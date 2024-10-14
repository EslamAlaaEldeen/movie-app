import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:moviesapp/core/Parameters/tv_parameter.dart';
import 'package:moviesapp/core/utils/enum.dart';
import 'package:moviesapp/feature/tvs/domain/entities/Tv_Recommendation.dart';
import 'package:moviesapp/feature/tvs/domain/entities/tv_details.dart';
import 'package:moviesapp/feature/tvs/domain/entities/tv_episodes.dart';
import 'package:moviesapp/feature/tvs/domain/usecases/get_tv_details_use_case.dart';
import 'package:moviesapp/feature/tvs/domain/usecases/get_tv_episodes_use_case.dart';
import 'package:moviesapp/feature/tvs/domain/usecases/get_tv_recommendation_use_case.dart';

part 'tv_details_event.dart';
part 'tv_details_state.dart';

class TvDetailsBloc extends Bloc<TvDetailsEvent, TvDetailsState> {
  final GetTvDetailsUseCase getTvDetailsUseCase;
  final GetTvRecommendationUseCase getTvRecommendationUseCase;
  final GetTvEpisodesUseCase getTvEpisodesUseCase;

  TvDetailsBloc(this.getTvDetailsUseCase, this.getTvRecommendationUseCase,
      this.getTvEpisodesUseCase)
      : super(const TvDetailsState()) {
    on<GetTvDetailsEvent>(_getTvDetails);
    on<GetTvRecommendationEvent>(_getTvRecommendation);
    on<GetTvEpisodesEvent>(_getTvEpisodes);
    on<PageChangedEvent>(_onPageChanged);
  }

  FutureOr<void> _getTvDetails(
      GetTvDetailsEvent event, Emitter<TvDetailsState> emit) async {
    final result =
        await getTvDetailsUseCase(TvDetailsParameter(tvId: event.id));
    result.fold(
        (l) => emit(state.copyWith(
            tvDetailsState: RequestState.error, tvDetailsMessage: l.message)),
        (r) => emit(state.copyWith(
            tvDetailsState: RequestState.success, tvDetails: r)));
  }

  FutureOr<void> _getTvRecommendation(
      GetTvRecommendationEvent event, Emitter<TvDetailsState> emit) async {
    final result =
        await getTvRecommendationUseCase(TvRecommendationParameter(event.id));
    result.fold(
        (l) => emit(state.copyWith(
            tvRecommendationState: RequestState.error,
            tvDetailsMessage: l.message)),
        (r) => emit(state.copyWith(
            tvRecommendationState: RequestState.success, tvRecommendation: r)));
  }

  FutureOr<void> _getTvEpisodes(
      GetTvEpisodesEvent event, Emitter<TvDetailsState> emit) async {
    final result = await getTvEpisodesUseCase(
        TvEpisodesParameter(event.id, event.seasonNumber));
    result.fold(
        (l) => emit(state.copyWith(
            tvEpisodesState: RequestState.error, tvEpisodesMessage: l.message)),
        (r) => emit(state.copyWith(
            tvEpisodesState: RequestState.success, tvEpisodes: r)));
  }

  bool isSelected = true;
  void selectedButton(bool select) {
    isSelected = select;
  }

  FutureOr<void> _onPageChanged(
      PageChangedEvent event, Emitter<TvDetailsState> emit) {
    emit(state.copyWith(currentPageIndex: event.pageIndex));
  }
}
