import 'package:caronas_usp/app/modules/historico/bloc/historico_event.dart';
import 'package:caronas_usp/app/modules/historico/bloc/historico_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoricoBloc extends Bloc<HistoricoEvent, HistoricoState> {

  HistoricoBloc() : super(HistoricoLoading()) {
    on<FetchHistorico>((event, emit) async {
      emit(HistoricoLoading());
      emit(HistoricoLoaded());
    });
  }
}
