import 'package:dio/dio.dart';
import 'package:nest_movie/core/data/error/exceptions.dart';
import 'package:nest_movie/core/domain/entities/media.dart';
import 'package:nest_movie/core/domain/entities/media_details.dart';
import 'package:nest_movie/tv_shows/data/datasource/tv_shows_remote_data_source.dart';
import 'package:nest_movie/tv_shows/domain/entities/season_details.dart';
import 'package:nest_movie/core/data/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:nest_movie/tv_shows/domain/repository/tv_shows_repository.dart';
import 'package:nest_movie/tv_shows/domain/usecases/get_season_details_usecase.dart';

class TVShowsRepositoryImpl extends TVShowsRepository {
  final TVShowsRemoteDataSource _baseTVShowsRemoteDataSource;

  TVShowsRepositoryImpl(this._baseTVShowsRemoteDataSource);

  @override
  Future<Either<Failure, List<List<Media>>>> getTVShows() async {
    try {
      final result = await _baseTVShowsRemoteDataSource.getTVShows();
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    } on DioError catch (failure) {
      return Left(ServerFailure(failure.message));
    }
  }

  @override
  Future<Either<Failure, MediaDetails>> getTVShowDetails(int id) async {
    try {
      final result = await _baseTVShowsRemoteDataSource.getTVShowDetails(id);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    } on DioError catch (failure) {
      return Left(ServerFailure(failure.message));
    }
  }

  @override
  Future<Either<Failure, SeasonDetails>> getSeasonDetails(
      SeasonDetailsParams params) async {
    try {
      final result =
          await _baseTVShowsRemoteDataSource.getSeasonDetails(params);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    } on DioError catch (failure) {
      return Left(ServerFailure(failure.message));
    }
  }

  @override
  Future<Either<Failure, List<Media>>> getAllPopularTVShows(int page) async {
    try {
      final result =
          await _baseTVShowsRemoteDataSource.getAllPopularTVShows(page);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    } on DioError catch (failure) {
      return Left(ServerFailure(failure.message));
    }
  }

  @override
  Future<Either<Failure, List<Media>>> getAllTopRatedTVShows(int page) async {
    try {
      final result =
          await _baseTVShowsRemoteDataSource.getAllTopRatedTVShows(page);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    } on DioError catch (failure) {
      return Left(ServerFailure(failure.message));
    }
  }
}
