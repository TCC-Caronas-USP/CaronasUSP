import 'package:caronas_usp/app/models/rider.dart';
import 'package:caronas_usp/app/modules/historico/bloc/historico_event.dart';
import 'package:caronas_usp/app/modules/historico/bloc/historico_state.dart';
import 'package:caronas_usp/app/repositories/rider_repository.dart';
import 'package:caronas_usp/app/repositories/rides_repository.dart';
import 'package:caronas_usp/app/models/ride.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoricoBloc extends Bloc<HistoricoEvent, HistoricoState> {
  final RidesRepository ridesRepository;
  final RiderRepository riderRepository;

  HistoricoBloc(this.ridesRepository, this.riderRepository)
      : super(HistoricoLoading()) {
    on<FetchHistorico>((event, emit) async {
      emit(HistoricoLoading());

      final List<List<Ride>> myRides = await ridesRepository.getMyRides();
      final Rider rider = await riderRepository.getRider();

      emit(HistoricoLoaded(myRides, rider));
    });
  }
}
