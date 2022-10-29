import 'package:caronas_usp/app/modules/entrar/bloc/entrar_event.dart';
import 'package:caronas_usp/app/modules/entrar/bloc/entrar_state.dart';
import 'package:caronas_usp/app/repositories/rides_repository.dart';
import 'package:caronas_usp/model/ride.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EntrarBloc extends Bloc<EntrarEvent, EntrarState> {
  final RidesRepository ridesRepository;

  EntrarBloc(this.ridesRepository) : super(EnterLoading()) {
    on<FetchEntering>((event, emit) async {
      emit(EnterLoading());

      final Ride ride = event.ride;
      emit(Entering(ride));
    });

    on<FetchSuggest>((event, emit) async {
      final bool? entered = await ridesRepository.enterRide(event.ride);
      emit(Suggested(entered!));
    });
  }
}