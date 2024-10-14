import 'package:get_it/get_it.dart';
import 'package:moviesapp/feature/Movies/data/datasource/movie_remote_data_source.dart';
import 'package:moviesapp/feature/Movies/data/repository/movie_repository.dart';
import 'package:moviesapp/feature/Movies/domain/repository/base_movie_repository.dart';
import 'package:moviesapp/feature/Movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:moviesapp/feature/Movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:moviesapp/feature/Movies/domain/usecases/get_popular_movies_list_usecase.dart';
import 'package:moviesapp/feature/Movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:moviesapp/feature/Movies/domain/usecases/get_recommendation_usecase.dart';
import 'package:moviesapp/feature/Movies/domain/usecases/get_top_rated_move_list_usecase.dart';
import 'package:moviesapp/feature/Movies/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:moviesapp/feature/Movies/presentation/controller/movie_list_bloc.dart';
import 'package:moviesapp/feature/Movies/presentation/controller/movies_bloc.dart';
import 'package:moviesapp/feature/Movies/presentation/controller/movies_details_bloc.dart';
import 'package:moviesapp/feature/search/data/data_source/search_remote_data_source.dart';
import 'package:moviesapp/feature/search/data/repository/search%20_repository.dart';
import 'package:moviesapp/feature/search/domain/repository/base_search_repository.dart';
import 'package:moviesapp/feature/search/domain/usecase/get_search_use_case.dart';
import 'package:moviesapp/feature/search/presentation/controller/search_bloc.dart';
import 'package:moviesapp/feature/tvs/data/datasource/tv_remote_data_source.dart';
import 'package:moviesapp/feature/tvs/data/repository/tv_repository.dart';
import 'package:moviesapp/feature/tvs/domain/repository/base_tv_repository.dart';
import 'package:moviesapp/feature/tvs/domain/usecases/get_on_air_tv_usecase.dart';
import 'package:moviesapp/feature/tvs/domain/usecases/get_popular_tv_list_usecase.dart';
import 'package:moviesapp/feature/tvs/domain/usecases/get_popular_tv_usecase.dart';
import 'package:moviesapp/feature/tvs/domain/usecases/get_top_rated_tv_list_use-case.dart';
import 'package:moviesapp/feature/tvs/domain/usecases/get_top_rated_tv_use_case.dart';
import 'package:moviesapp/feature/tvs/domain/usecases/get_tv_details_use_case.dart';
import 'package:moviesapp/feature/tvs/domain/usecases/get_tv_episodes_use_case.dart';
import 'package:moviesapp/feature/tvs/domain/usecases/get_tv_recommendation_use_case.dart';
import 'package:moviesapp/feature/tvs/presentation/controller/tv_bloc.dart';
import 'package:moviesapp/feature/tvs/presentation/controller/tv_details_bloc.dart';
import 'package:moviesapp/feature/tvs/presentation/controller/tv_list_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    ///Data Source
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource());
    sl.registerLazySingleton<BaseTvRemoteDataSource>(
        () => TvRemoteDataSource());
    sl.registerLazySingleton<BaseSearchRemoteDataSource>(
        () => SearchRemoteDatasource());

    /// Repository
    sl.registerLazySingleton<BaseMovieRepository>(() => MovieRepository(sl()));
    sl.registerLazySingleton<BaseTvRepository>(() => TvRepository(sl()));
    sl.registerLazySingleton<BaseSearchRepository>(
        () => SearchRepository(sl()));

    ///Use Cases
    sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetMovieDetailsUseCase(sl()));
    sl.registerLazySingleton(() => GetRecommendationUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesListUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesListUseCase(sl()));

    sl.registerLazySingleton(() => GetOnAirUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularTvUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedTvUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularTvListUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedTvListUseCase(sl()));
    sl.registerLazySingleton(() => GetTvDetailsUseCase(sl()));
    sl.registerLazySingleton(() => GetTvEpisodesUseCase(sl()));
    sl.registerLazySingleton(() => GetTvRecommendationUseCase(sl()));

    sl.registerLazySingleton(() => SearchUseCase(sl()));

    ///Bloc
    sl.registerFactory(() => MoviesBloc(sl(), sl(), sl()));
    sl.registerFactory(() => MoviesDetailsBloc(sl(), sl()));
    sl.registerFactory(() => MovieListBloc(sl(), sl()));

    sl.registerFactory(() => TvBloc(sl(), sl(), sl()));
    sl.registerFactory(() => TvListBloc(
          sl(),
          sl(),
        ));
    sl.registerFactory(() => TvDetailsBloc(sl(), sl(), sl()));

    sl.registerFactory(() => SearchBloc(sl()));
  }
}
