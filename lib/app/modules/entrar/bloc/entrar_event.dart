import 'package:caronas_usp/model/ride.dart';
import 'package:equatable/equatable.dart';

abstract class EntrarEvent extends Equatable{
  final List? _props;

  EntrarEvent([this._props]);

  @override
  List<Object> get props => _props as List<Object>;
}

class FetchEntering extends EntrarEvent {
  final Ride ride;

  FetchEntering(this.ride) : super([ride]);
}

class FetchSuggest extends EntrarEvent {
  final Ride ride;

  FetchSuggest(this.ride) : super([ride]);
}

