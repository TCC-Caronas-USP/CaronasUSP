import 'package:caronas_usp/model/ride.dart';
import 'package:equatable/equatable.dart';

abstract class EntrarState extends Equatable {
  final List _props;

  const EntrarState(this._props);

  @override
  List get props => _props;
}

class EnterLoading extends EntrarState {
  EnterLoading() : super([]);
}

class Entering extends EntrarState {
  final Ride ride;

  Entering(this.ride) : super([ride]);
}

class Suggested extends EntrarState {
  final bool sugested;

  Suggested(this.sugested) : super([sugested]);
}