import 'package:caronas_usp/app/modules/aceitar/bloc/aceitar_event.dart';
import 'package:caronas_usp/app/modules/aceitar/bloc/aceitar_state.dart';
import 'package:caronas_usp/app/repositories/passenger_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AceitarBloc extends Bloc<AceitarEvent, AceitarState> {
  final PassengerRepository passengerRepository;

  AceitarBloc(this.passengerRepository) : super(ValidatingPassenger()) {
    on<PassengerAccepted>((event, emit) async {
      emit(ValidatingPassenger());

      final bool accepted = await passengerRepository.acceptPassenger(event.passenger);
      emit(PassengerValidated(accepted));
    });

    on<PassengerRejected>((event, emit) async {
      emit(ValidatingPassenger());

      final bool rejected = await passengerRepository.rejectPassenger(event.passenger);
      emit(PassengerValidated(rejected));
    });
  }
}