import 'package:caronas_usp/app/modules/entrar/bloc/entrar_event.dart';
import 'package:caronas_usp/app/modules/entrar/bloc/entrar_state.dart';
import 'package:caronas_usp/app/repositories/rides_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EntrarBloc extends Bloc<EntrarEvent, EntrarState> {
  final RidesRepository ridesRepository;

  EntrarBloc(this.ridesRepository) : super(Entering()) {
    on<SuggestPlace>((event, emit) async {
      emit(Suggesting());

      final bool entered = await ridesRepository.enterRide(event.ride, event.newLocation);
      emit(Suggested(entered));
    });
  }
}