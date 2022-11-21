import 'package:equatable/equatable.dart';

abstract class DetalhesState extends Equatable {
  final List _props;

  const DetalhesState(this._props);

  @override
  List get props => _props;
}

class RideDetails extends DetalhesState {
  RideDetails() : super([]);
}

class Canceling extends DetalhesState {
  Canceling() : super([]);
}

class Canceled extends DetalhesState {
  final bool? canceled;

  Canceled(this.canceled) : super([canceled]);
}
