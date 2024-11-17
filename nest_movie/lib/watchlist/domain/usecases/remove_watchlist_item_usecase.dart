import 'package:dartz/dartz.dart';
import 'package:nest_movie/core/data/error/failure.dart';
import 'package:nest_movie/core/domain/usecase/base_use_case.dart';
import 'package:nest_movie/watchlist/domain/repository/watchlist_repository.dart';

class RemoveWatchlistItemUseCase extends BaseUseCase<Unit, int> {
  final WatchlistRepository _baseWatchListRepository;

  RemoveWatchlistItemUseCase(this._baseWatchListRepository);

  @override
  Future<Either<Failure, Unit>> call(int p) async {
    return await _baseWatchListRepository.removeWatchListItem(p);
  }
}
