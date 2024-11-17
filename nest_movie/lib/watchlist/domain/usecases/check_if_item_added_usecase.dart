import 'package:nest_movie/core/data/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:nest_movie/core/domain/usecase/base_use_case.dart';
import 'package:nest_movie/watchlist/domain/repository/watchlist_repository.dart';

class CheckIfItemAddedUseCase extends BaseUseCase<int, int> {
  final WatchlistRepository _watchlistRepository;

  CheckIfItemAddedUseCase(this._watchlistRepository);
  @override
  Future<Either<Failure, int>> call(int p) async {
    return await _watchlistRepository.checkIfItemAdded(p);
  }
}
