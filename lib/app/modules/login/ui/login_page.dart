import 'package:caronas_usp/app/core/constants.dart';
import 'package:caronas_usp/app/modules/login/bloc/login_bloc.dart';
import 'package:caronas_usp/app/modules/login/bloc/login_event.dart';
import 'package:caronas_usp/app/modules/login/bloc/login_state.dart';
import 'package:caronas_usp/widget/forbidden_email_access_widget.dart';
import 'package:caronas_usp/widget/logged_in_widget.dart';
import 'package:caronas_usp/widget/personal_information_widget.dart';
import 'package:caronas_usp/widget/sign_up_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginBloc? _loginBloc;
  bool _loading = true;
  AccountStatus accountStatus = AccountStatus.loggedOut;

  @override
  void initState() {
    super.initState();
    _loginBloc = context.read<LoginBloc>();
    _loginBloc!.add(LoadLogin());
  }

  Future<void> _handleListener(BuildContext context, LoginState state) async {
    if (state is LoginLoading) {
      _loading = true;
    }
    if (state is LoginLoaded) {
      _loading = false;
      accountStatus = state.accountStatus;
    }
    if (state is LoginAttempted) {
      _loading = false;
      accountStatus = state.accountStatus;
    }
  }

  void onSignUpPressed(){
    _loginBloc!.add(TryLogin());
  }

  Widget getCurrentLoginStateWidget(){
    if (_loading) return const Center(child: CircularProgressIndicator());
    switch (accountStatus){
      case AccountStatus.banned:
        return const ForbiddenEmailAccess();
      case AccountStatus.domainNotAllowed:
        return const ForbiddenEmailAccess();
      case AccountStatus.loggedOut:
        return SignUpWidget(onSignUpPressed);
      case AccountStatus.loggedIn:
        return PersonalInformationWidget();
    }
  }

  @override
  Widget build(BuildContext context) => BlocConsumer<LoginBloc, LoginState>(
      bloc: _loginBloc,
      listener: _handleListener,
      builder: (BuildContext context, LoginState state) {
        return Scaffold(
          body: getCurrentLoginStateWidget()
        );
      });
}