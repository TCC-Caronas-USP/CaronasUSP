import 'package:caronas_usp/app/modules/login/bloc/login_event.dart';
import 'package:caronas_usp/app/modules/login/bloc/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {

  LoginBloc() : super(LoginLoading()) {
    on<FetchLogin>((event, emit) async {
      emit(LoginLoading());
      emit(LoginLoaded());
    });
  }
}
