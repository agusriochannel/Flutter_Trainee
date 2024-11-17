import 'package:dartz/dartz.dart';
import 'package:nest_movie/core/data/error/failure.dart';
import 'package:nest_movie/search/domain/entities/search_result_item.dart';

abstract class SearchRepository {
  Future<Either<Failure, List<SearchResultItem>>> search(String title);
}
