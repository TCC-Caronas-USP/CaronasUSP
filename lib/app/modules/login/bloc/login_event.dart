import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  final List? _props;

  LoginEvent([this._props]);

  @override
  List<Object> get props => _props as List<Object>;
}

class TryLogin extends LoginEvent {
  TryLogin() : super();
}

class Register extends LoginEvent {
  Map<String, dynamic> personalInfo;

  Register(this.personalInfo) : super([personalInfo]);
}

class Logout extends LoginEvent {
  Logout() : super();
}
