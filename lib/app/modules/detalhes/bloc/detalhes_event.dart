import 'package:caronas_usp/model/ride.dart';
import 'package:equatable/equatable.dart';

abstract class DetalhesEvent extends Equatable {
  final List? _props;

  DetalhesEvent([this._props]);

  @override
  List<Object> get props => _props as List<Object>;
}

class FetchRide extends DetalhesEvent {
  final Ride ride;

  FetchRide(this.ride) : super([ride]);
}

class CancelRide extends DetalhesEvent {
  final String rideId;

  CancelRide(this.rideId) : super([rideId]);
}
