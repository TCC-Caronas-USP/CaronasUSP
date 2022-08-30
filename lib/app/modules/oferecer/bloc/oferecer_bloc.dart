import 'package:caronas_usp/app/modules/oferecer/bloc/oferecer_event.dart';
import 'package:caronas_usp/app/modules/oferecer/bloc/oferecer_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OferecerBloc extends Bloc<OferecerEvent, OferecerState> {

  OferecerBloc() : super(OferecerLoading()) {
    on<FetchOferecer>((event, emit) async {
      emit(OferecerLoading());
      emit(OferecerLoaded());
    });
  }
}
