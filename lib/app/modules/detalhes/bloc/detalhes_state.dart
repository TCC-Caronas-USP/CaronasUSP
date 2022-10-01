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

class Canceling extends DetalhesState {
  Canceling() : super([]);
}

class Canceled extends DetalhesState {
  final bool? canceled;

  Canceled(this.canceled) : super([canceled]);
}
