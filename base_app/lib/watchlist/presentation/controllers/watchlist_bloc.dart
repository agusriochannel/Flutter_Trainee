import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:base_app/watchlist/presentation/controllers/index.dart';

class WatchlistBloc extends Bloc<WatchlistEvent, WatchlistState> {
  // todo: check singleton for logic in project
  // use GetIt for DI in projct
  static final WatchlistBloc _watchlistBlocSingleton = WatchlistBloc._internal();
  factory WatchlistBloc() {
    return _watchlistBlocSingleton;
  }
  
  WatchlistBloc._internal(): super(UnWatchlistState(0)){
    on<WatchlistEvent>((event, emit) {
      return emit.forEach<WatchlistState>(
        event.applyAsync(currentState: state, bloc: this),
        onData: (state) => state,
        onError: (error, stackTrace) {
          developer.log('$error', name: 'WatchlistBloc', error: error, stackTrace: stackTrace);
          return ErrorWatchlistState(0, error.toString());
        },
      );
    });
  }
  
  @override
  Future<void> close() async{
    // dispose objects
    await super.close();
  }

  @override
  WatchlistState get initialState => UnWatchlistState(0);

}
