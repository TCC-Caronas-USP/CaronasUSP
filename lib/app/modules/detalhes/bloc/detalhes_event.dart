import 'package:equatable/equatable.dart';

abstract class DetalhesEvent extends Equatable {
  final List? _props;

  DetalhesEvent([this._props]);

  @override
  List<Object> get props => _props as List<Object>;
}

class FetchRideDetails extends DetalhesEvent {
  final int rideId;

  FetchRideDetails(this.rideId) : super([rideId]);
}

class CancelRide extends DetalhesEvent {
  final int rideId;

  CancelRide(this.rideId) : super([rideId]);
}
