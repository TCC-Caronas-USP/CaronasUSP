import 'package:caronas_usp/app/modules/oferecer/bloc/oferecer_event.dart';
import 'package:caronas_usp/app/modules/oferecer/bloc/oferecer_state.dart';
import 'package:caronas_usp/app/repositories/rides_repository.dart';
import 'package:caronas_usp/app/models/ride.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OferecerBloc extends Bloc<OferecerEvent, OferecerState> {
  final RidesRepository ridesRepository;

  OferecerBloc(this.ridesRepository) : super(OferecerLoading()) {
    on<FetchUserOfferedRides>((event, emit) async {
      emit(OferecerLoading());

      final List<List<Ride>> userOfferedRides = await ridesRepository.getUserOfferedRides();
      emit(OferecerLoaded(userOfferedRides));
    });
  }
}
