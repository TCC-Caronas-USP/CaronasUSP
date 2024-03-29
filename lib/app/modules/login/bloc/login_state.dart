import 'package:caronas_usp/app/models/rider.dart';
import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  final List _props;

  const LoginState(this._props);

  @override
  List get props => _props;
}

class LoginLoading extends LoginState {
  LoginLoading() : super([]);
}

class UserBanned extends LoginState {
  UserBanned() : super([]);
}

class LoggedIn extends LoginState {
  final Rider rider;

  LoggedIn(this.rider) : super([rider]);
}

class GoogleLoggedIn extends LoginState {
  GoogleLoggedIn() : super([]);
}

class LoggedInFirstTime extends LoginState {
  LoggedInFirstTime() : super([]);
}

class LoggedOut extends LoginState {
  LoggedOut() : super([]);
}

class EmailDomainNotAllowed extends LoginState {
  EmailDomainNotAllowed() : super([]);
}
