import 'package:caronas_usp/app/models/rider.dart';
import 'package:caronas_usp/app/modules/pegar/bloc/pegar_event.dart';
import 'package:caronas_usp/app/modules/pegar/bloc/pegar_state.dart';
import 'package:caronas_usp/app/repositories/rider_repository.dart';
import 'package:caronas_usp/app/repositories/rides_repository.dart';
import 'package:caronas_usp/app/models/ride.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PegarBloc extends Bloc<PegarEvent, PegarState> {
  final RidesRepository ridesRepository;
  final RiderRepository riderRepository;

  PegarBloc(this.ridesRepository, this.riderRepository)
      : super(PegarLoading()) {
    on<FetchPegar>((event, emit) async {
      emit(PegarLoading());

      final List<List<Ride>> offeredRides =
          await ridesRepository.getOfferedRides();
      final Rider rider = await riderRepository.getRider();
      emit(PegarLoaded(offeredRides, rider));
    });
  }
}
