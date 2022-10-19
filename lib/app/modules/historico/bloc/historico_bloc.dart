import 'package:caronas_usp/app/modules/historico/bloc/historico_event.dart';
import 'package:caronas_usp/app/modules/historico/bloc/historico_state.dart';
import 'package:caronas_usp/app/repositories/rides_repository.dart';
import 'package:caronas_usp/model/ride.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoricoBloc extends Bloc<HistoricoEvent, HistoricoState> {
  final RidesRepository ridesRepository;

  HistoricoBloc(this.ridesRepository) : super(HistoricoLoading()) {
    on<FetchHistorico>((event, emit) async {
      emit(HistoricoLoading());

      final List<List<Ride>> myRides = await ridesRepository.getMyRides();
      emit(HistoricoLoaded(myRides));
    });
  }
}
