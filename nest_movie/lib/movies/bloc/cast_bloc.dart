import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'cast_event.dart';
part 'cast_state.dart';

class CastBloc extends Bloc<CastEvent, CastState> {
  CastBloc() : super(CastInitial()) {
    on<CastEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

// ini uji coba Generate bloc - agusrio
