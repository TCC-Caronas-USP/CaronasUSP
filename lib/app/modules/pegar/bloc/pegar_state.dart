import 'package:caronas_usp/model/ride.dart';
import 'package:equatable/equatable.dart';

abstract class PegarState extends Equatable {
  final List _props;

  const PegarState(this._props);

  @override
  List get props => _props;
}

class PegarLoading extends PegarState {
  PegarLoading() : super([]);
}

class PegarLoaded extends PegarState {
  final List<List<Ride>> offeredRides;

  PegarLoaded(this.offeredRides) : super([offeredRides]);
}
