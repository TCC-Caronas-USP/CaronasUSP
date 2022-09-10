import 'package:equatable/equatable.dart';

abstract class OferecerEvent extends Equatable {
  final List? _props;

  OferecerEvent([this._props]);

  @override
  List<Object> get props => _props as List<Object>;
}

class FetchUserOfferedRides extends OferecerEvent {
  FetchUserOfferedRides() : super();
}
