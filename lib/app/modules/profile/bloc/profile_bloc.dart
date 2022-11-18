import 'package:caronas_usp/app/modules/profile/bloc/profile_event.dart';
import 'package:caronas_usp/app/modules/profile/bloc/profile_state.dart';
import 'package:caronas_usp/app/repositories/rider_repository.dart';
import 'package:caronas_usp/app/models/rider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final RiderRepository riderRepository;

  ProfileBloc(this.riderRepository) : super(ProfileLoading()) {
    on<FetchUserInfo>((event, emit) async {
      emit(ProfileLoading());
      final Rider rider = await riderRepository.getRider();
      emit(ProfileLoaded(rider));
    });
  }
}
