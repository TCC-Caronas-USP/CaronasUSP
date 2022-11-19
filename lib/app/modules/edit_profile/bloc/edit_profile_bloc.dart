import 'package:caronas_usp/app/modules/edit_profile/bloc/edit_profile_event.dart';
import 'package:caronas_usp/app/modules/edit_profile/bloc/edit_profile_state.dart';
import 'package:caronas_usp/app/repositories/rider_repository.dart';
import 'package:caronas_usp/model/rider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {
  final RiderRepository riderRepository;

  EditProfileBloc(this.riderRepository) : super(EditProfileLoading()){
    on<FetchRiderInfo>((event, emit) async {
      emit(EditProfileLoading());

      final Rider rider = await riderRepository.getRider();
      emit(EditProfileLoaded(rider));
    });

    on<UpdateRiderInfo>((event, emit) async {
      emit(EditProfileLoading());

      final bool updated = await riderRepository.updateRiderInfo(event.rider);
      emit(EditedProfile(updated));
    });

    on<InsertVehicleInfo>((event, emit) async {
      emit(EditProfileLoading());

      final bool inserted = await riderRepository.insertVehicleInfo(event.vehicle);
      emit(EditedVehicle(inserted));
    });

    on<UpdateVehicleInfo>((event, emit) async {
      emit(EditProfileLoading());

      final bool updated = await riderRepository.updateVehicleInfo(event.vehicle);
      emit(EditedVehicle(updated));
    });
  }
}