import 'package:caronas_usp/app/modules/detalhes/bloc/detalhes_event.dart';
import 'package:caronas_usp/app/modules/detalhes/bloc/detalhes_state.dart';
import 'package:caronas_usp/app/repositories/rides_repository.dart';
import 'package:caronas_usp/model/ride.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetalhesBloc extends Bloc<DetalhesEvent, DetalhesState> {
  final RidesRepository ridesRepository;

  DetalhesBloc(this.ridesRepository) : super(DetalhesLoading()) {
    on<FetchRide>((event, emit) async {
      emit(DetalhesLoading());

      final Ride? ride = await ridesRepository.getRide(event.rideId);
      emit(DetalhesLoaded(ride!));
    });
  }
}
