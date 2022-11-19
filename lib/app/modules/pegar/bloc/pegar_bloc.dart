import 'package:caronas_usp/app/modules/pegar/bloc/pegar_event.dart';
import 'package:caronas_usp/app/modules/pegar/bloc/pegar_state.dart';
import 'package:caronas_usp/app/repositories/rides_repository.dart';
import 'package:caronas_usp/app/models/ride.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PegarBloc extends Bloc<PegarEvent, PegarState> {
  final RidesRepository ridesRepository;

  PegarBloc(this.ridesRepository) : super(PegarLoading()) {
    on<FetchPegar>((event, emit) async {
      emit(PegarLoading());

      final List<List<Ride>> offeredRides =
          await ridesRepository.getOfferedRides();
      emit(PegarLoaded(offeredRides));
    });
  }
}
