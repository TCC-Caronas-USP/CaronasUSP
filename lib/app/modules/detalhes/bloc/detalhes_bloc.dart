import 'package:caronas_usp/app/models/ride.dart';
import 'package:caronas_usp/app/modules/detalhes/bloc/detalhes_event.dart';
import 'package:caronas_usp/app/modules/detalhes/bloc/detalhes_state.dart';
import 'package:caronas_usp/app/repositories/rides_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetalhesBloc extends Bloc<DetalhesEvent, DetalhesState> {
  final RidesRepository ridesRepository;

  DetalhesBloc(this.ridesRepository) : super(RideDetailsLoading()) {
    on<FetchRideDetails>((event, emit) async {
      emit(RideDetailsLoading());

      Ride ride = await ridesRepository.getRide(event.rideId);
      emit(RideDetails(ride));
    });

    on<CancelRide>((event, emit) async {
      emit(Canceling());

      final bool canceled = await ridesRepository.cancelRide(event.rideId);
      emit(Canceled(canceled));
    });
  }
}
