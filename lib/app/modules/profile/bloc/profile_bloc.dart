import 'dart:developer';

import 'package:caronas_usp/app/modules/profile/bloc/profile_event.dart';
import 'package:caronas_usp/app/modules/profile/bloc/profile_state.dart';
import 'package:caronas_usp/app/repositories/user_repository.dart';
import 'package:caronas_usp/model/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final UserRepository userRepository;

  ProfileBloc(this.userRepository) : super(ProfileLoading()) {
    on<FetchUserInfo>((event, emit) async {
      emit(ProfileLoading());

      final User user = await userRepository.getUser(event.email);
      emit(ProfileLoaded(user));
    });
  }
}
