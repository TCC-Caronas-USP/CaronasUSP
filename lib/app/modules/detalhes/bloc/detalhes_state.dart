import 'package:caronas_usp/model/ride.dart';
import 'package:equatable/equatable.dart';

abstract class DetalhesState extends Equatable {
  final List _props;

  const DetalhesState(this._props);

  @override
  List get props => _props;
}

class DetalhesLoading extends DetalhesState {
  DetalhesLoading() : super([]);
}

class DetalhesLoaded extends DetalhesState {
  final Ride? ride;

  DetalhesLoaded(this.ride) : super([ride]);
}
