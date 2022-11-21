import 'package:caronas_usp/app/models/ride.dart';
import 'package:equatable/equatable.dart';

abstract class DetalhesState extends Equatable {
  final List _props;

  const DetalhesState(this._props);

  @override
  List get props => _props;
}

class RideDetailsLoading extends DetalhesState {
  RideDetailsLoading() : super([]);
}

class RideDetails extends DetalhesState {
  final Ride ride;

  RideDetails(this.ride) : super([ride]);
}

class Canceling extends DetalhesState {
  Canceling() : super([]);
}

class Canceled extends DetalhesState {
  final bool? canceled;

  Canceled(this.canceled) : super([canceled]);
}
