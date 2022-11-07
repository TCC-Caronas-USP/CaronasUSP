import 'package:caronas_usp/model/location.dart';
import 'package:caronas_usp/model/ride.dart';
import 'package:equatable/equatable.dart';

abstract class EntrarEvent extends Equatable{
  final List? _props;

  EntrarEvent([this._props]);

  @override
  List<Object> get props => _props as List<Object>;
}

class SuggestPlace extends EntrarEvent {
  final Ride ride;
  final Location newLocation;

  SuggestPlace(this.ride, this.newLocation) : super([ride, newLocation]);
}

