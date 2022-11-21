import 'package:caronas_usp/app/modules/login/bloc/login_bloc.dart';
import 'package:caronas_usp/app/modules/login/bloc/login_event.dart';
import 'package:caronas_usp/app/modules/login/bloc/login_state.dart';
import 'package:caronas_usp/app/modules/login/ui/forbidden_email_access_widget.dart';
import 'package:caronas_usp/app/modules/login/ui/logged_in_widget.dart';
import 'package:caronas_usp/app/modules/login/ui/register_widget.dart';
import 'package:caronas_usp/app/modules/login/ui/sign_up_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginBloc? _loginBloc;

  @override
  void initState() {
    super.initState();
    _loginBloc = context.read<LoginBloc>();
  }

  void onSignUpPressed() {
    _loginBloc!.add(TryLogin());
  }

  void onRegisterPressed(Map<String, dynamic> personalInfo) {
    _loginBloc!.add(Register(personalInfo));
  }

  Widget getCurrentLoginStateWidget(LoginState state) {
    if (state is LoginLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (state is UserBanned) {
      return const ForbiddenEmailAccess();
    }
    if (state is EmailDomainNotAllowed) {
      return const ForbiddenEmailAccess();
    }
    if (state is LoggedOut) {
      return SignUpWidget(onSignUpPressed);
    }
    if (state is LoggedIn) {
      return LoggedInWidget();
    }
    if (state is LoggedInFirstTime) {
      return RegisterWidget(onRegisterPressed);
    } else {
      return const Center(child: CircularProgressIndicator());
    }
  }

  @override
  Widget build(BuildContext context) => BlocBuilder<LoginBloc, LoginState>(
      bloc: _loginBloc,
      builder: (BuildContext context, LoginState state) {
        return Scaffold(body: getCurrentLoginStateWidget(state));
      });
}
