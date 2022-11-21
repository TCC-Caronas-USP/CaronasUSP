import 'package:caronas_usp/app/repositories/rider_repository.dart';
import 'package:caronas_usp/app/repositories/rides_repository.dart';
import 'package:caronas_usp/app/models/rider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'criar_event.dart';
import 'criar_state.dart';

class CriarBloc extends Bloc<CriarEvent, CriarState> {
  final RidesRepository ridesRepository;
  final RiderRepository riderRepository;

  CriarBloc(this.ridesRepository, this.riderRepository) : super(CreateLoading()) {
    on<FetchCreating>((event, emit) async {
      emit(CreateLoading());

      final Rider rider = await riderRepository.getRider();
      emit(Creating(rider));
    });

    on<FetchCreate>((event, emit) async {
      final bool? created = await ridesRepository.createRide(event.ride);
      emit(Created(created!));
    });
  }
}