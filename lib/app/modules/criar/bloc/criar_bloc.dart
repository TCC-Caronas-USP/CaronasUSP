import 'package:caronas_usp/app/repositories/rides_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'criar_event.dart';
import 'criar_state.dart';

class CriarBloc extends Bloc<CriarEvent, CriarState> {
  final RidesRepository ridesRepository;

  CriarBloc(this.ridesRepository) : super(Creating()) {
    on<FetchCreating>((event, emit) async {
      emit(Creating());
    });

    on<FetchCreate>((event, emit) async {
      final bool? created = await ridesRepository.createRide(event.ride);
      emit(Created(created!));
    });
  }
}