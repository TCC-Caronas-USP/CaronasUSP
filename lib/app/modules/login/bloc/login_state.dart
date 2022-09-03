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
  LoginLoaded() : super([]);
}
