import 'package:caronas_usp/app/modules/detalhes/bloc/detalhes_event.dart';
import 'package:caronas_usp/app/modules/detalhes/bloc/detalhes_state.dart';
import 'package:caronas_usp/app/repositories/rides_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetalhesBloc extends Bloc<DetalhesEvent, DetalhesState> {
  final RidesRepository ridesRepository;

  DetalhesBloc(this.ridesRepository) : super(DetalhesLoading()) {
    on<FetchRide>((event, emit) async {
      emit(DetalhesLoading());

      emit(DetalhesLoaded(event.ride));
    });

    on<CancelRide>((event, emit) async {
      emit(Canceling());

      final bool? canceled = await ridesRepository.cancelRide(event.rideId);
      emit(Canceled(canceled!));
    });
  }
}
