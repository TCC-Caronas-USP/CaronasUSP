import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  final List? _props;

  LoginEvent([this._props]);

  @override
  List<Object> get props => _props as List<Object>;
}

class LoadLogin extends LoginEvent {

  LoadLogin() : super();
}

class TryLogin extends LoginEvent {

  TryLogin() : super();
}

class Logout extends LoginEvent {

  Logout() : super();
}
