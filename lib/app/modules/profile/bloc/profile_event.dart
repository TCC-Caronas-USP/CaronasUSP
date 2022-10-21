import 'package:equatable/equatable.dart';

abstract class ProfileEvent extends Equatable {
  final List? _props;

  ProfileEvent([this._props]);

  @override
  List<Object> get props => _props as List<Object>;
}

class FetchUserInfo extends ProfileEvent {
  FetchUserInfo() : super([]);
}
