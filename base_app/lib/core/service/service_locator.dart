
import 'package:base_app/movies/data/datasource/movies_remote_data_source.dart';
import 'package:base_app/movies/data/repository/movies_repository_impl.dart';
import 'package:base_app/movies/domain/repository/movies_repository.dart';
import 'package:base_app/movies/presentation/controllers/movies_bloc/movies_bloc.dart';
import 'package:base_app/search/data/datasource/search_remote_data_source.dart';
import 'package:base_app/search/data/repository/search_repository_impl.dart';
import 'package:base_app/search/domain/repository/search_repository.dart';
import 'package:base_app/tv_shows/data/datasource/tv_shows_remote_data_source.dart';
import 'package:base_app/tv_shows/domain/repository/tv_shows_repository.dart';
import 'package:base_app/tv_shows/repository/tv_shows_repository_impl.dart';
import 'package:base_app/watchlist/data/datasource/watchlist_local_data_source.dart';
import 'package:base_app/watchlist/data/repository/watchlist_repository_impl.dart';
import 'package:base_app/watchlist/domain/repository/watchlist_repository.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;
 
class ServiceLocator {
  static void init() {
    // Data source
    sl.registerLazySingleton<MoviesRemoteDataSource>(
        () => MoviesRemoteDataSourceImpl());
    sl.registerLazySingleton<TVShowsRemoteDataSource>(
        () => TVShowsRemoteDataSourceImpl());
    sl.registerLazySingleton<SearchRemoteDataSource>(
        () => SearchRemoteDataSourceImpl());
    sl.registerLazySingleton<WatchlistLocalDataSource>(
        () => WatchlistLocalDataSourceImpl());

    // Repository
    sl.registerLazySingleton<MoviesRespository>(
        () => MoviesRepositoryImpl(sl()));
    sl.registerLazySingleton<TVShowsRepository>(
        () => TVShowsRepositoryImpl(sl()));
    sl.registerLazySingleton<SearchRepository>(
        () => SearchRepositoryImpl(sl()));
    sl.registerLazySingleton<WatchlistRepository>(
        () => WatchListRepositoryImpl(sl()));

    // Use Cases
    sl.registerLazySingleton(() => GetMoviesDetailsUseCase(sl()));
    sl.registerLazySingleton(() => GetMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetAllPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetAllTopRatedMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetTVShowsUseCase(sl()));
    sl.registerLazySingleton(() => GetTVShowDetailsUseCase(sl()));
    sl.registerLazySingleton(() => GetSeasonDetailsUseCase(sl()));
    sl.registerLazySingleton(() => GetAllPopularTVShowsUseCase(sl()));
    sl.registerLazySingleton(() => GetAllTopRatedTVShowsUseCase(sl()));
    sl.registerLazySingleton(() => SearchUseCase(sl()));
    sl.registerLazySingleton(() => GetWatchlistItemsUseCase(sl()));
    sl.registerLazySingleton(() => AddWatchlistItemUseCase(sl()));
    sl.registerLazySingleton(() => RemoveWatchlistItemUseCase(sl()));
    sl.registerLazySingleton(() => CheckIfItemAddedUseCase(sl()));

    // Bloc
    sl.registerFactory(() => MoviesBloc(sl()));
    sl.registerFactory(() => MovieDetailsBloc(sl()));
    sl.registerFactory(() => PopularMoviesBloc(sl()));
    sl.registerFactory(() => TopRatedMoviesBloc(sl()));
    sl.registerFactory(() => TVShowsBloc(sl()));
    sl.registerFactory(() => TVShowDetailsBloc(sl(), sl()));
    sl.registerFactory(() => PopularTVShowsBloc(sl()));
    sl.registerFactory(() => TopRatedTVShowsBloc(sl()));
    sl.registerFactory(() => SearchBloc(sl()));
    sl.registerFactory(() => WatchlistBloc(sl(), sl(), sl(), sl()));
  }
}
