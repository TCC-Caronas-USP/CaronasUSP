import 'package:equatable/equatable.dart';

abstract class DetalhesEvent extends Equatable {
  final List? _props;

  DetalhesEvent([this._props]);

  @override
  List<Object> get props => _props as List<Object>;
}

class FetchRide extends DetalhesEvent {
  final String rideId;

  FetchRide(this.rideId) : super([rideId]);
}
