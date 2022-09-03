import 'package:caronas_usp/app/modules/pegar/bloc/pegar_event.dart';
import 'package:caronas_usp/app/modules/pegar/bloc/pegar_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PegarBloc extends Bloc<PegarEvent, PegarState> {

  PegarBloc() : super(PegarLoading()) {
    on<FetchPegar>((event, emit) async {
      emit(PegarLoading());
      emit(PegarLoaded());
    });
  }
}
