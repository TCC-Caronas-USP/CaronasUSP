import 'package:caronas_usp/app/core/constants.dart';
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

class LoginLoaded extends LoginState {

  final AccountStatus accountStatus;

  LoginLoaded(this.accountStatus) : super([accountStatus]);
}

class LoginAttempted extends LoginState {

  final AccountStatus accountStatus;

  LoginAttempted(this.accountStatus) : super([accountStatus]);
}
