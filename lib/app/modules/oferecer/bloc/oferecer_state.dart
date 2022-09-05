import 'package:caronas_usp/model/ride.dart';
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

  OferecerLoaded(this.userOfferedRides) : super([]);
}
