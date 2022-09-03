import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  final List? _props;

  LoginEvent([this._props]);

  @override
  List<Object> get props => _props as List<Object>;
}

class FetchLogin extends LoginEvent {

  FetchLogin() : super();
}
