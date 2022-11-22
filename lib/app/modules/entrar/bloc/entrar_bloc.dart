import 'package:caronas_usp/app/modules/entrar/bloc/entrar_event.dart';
import 'package:caronas_usp/app/modules/entrar/bloc/entrar_state.dart';
import 'package:caronas_usp/app/repositories/passenger_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EntrarBloc extends Bloc<EntrarEvent, EntrarState> {
  final PassengerRepository passengerRepository;

  EntrarBloc(this.passengerRepository) : super(Entering()) {
    on<SuggestPlace>((event, emit) async {
      emit(Suggesting());

      final bool entered = await passengerRepository.postPassenger(event.passenger);
      emit(Suggested(entered));
    });
  }
}