import 'package:caronas_usp/app/models/ride.dart';
import 'package:caronas_usp/app/models/rider.dart';
import 'package:equatable/equatable.dart';

abstract class OferecerState extends Equatable {
  final List _props;

  const OferecerState(this._props);

  @override
  List get props => _props;
}

class OferecerLoading extends OferecerState {
  OferecerLoading() : super([]);
}

class OferecerLoaded extends OferecerState {
  final List<List<Ride>> userOfferedRides;
  final Rider rider;

  OferecerLoaded(this.userOfferedRides, this.rider)
      : super([userOfferedRides, rider]);
}
