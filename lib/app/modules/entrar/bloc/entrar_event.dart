import 'package:caronas_usp/app/models/passenger.dart';
import 'package:equatable/equatable.dart';

abstract class EntrarEvent extends Equatable{
  final List? _props;

  EntrarEvent([this._props]);

  @override
  List<Object> get props => _props as List<Object>;
}

class SuggestPlace extends EntrarEvent {
  final Passenger passenger;

  SuggestPlace(this.passenger) : super([passenger]);
}

