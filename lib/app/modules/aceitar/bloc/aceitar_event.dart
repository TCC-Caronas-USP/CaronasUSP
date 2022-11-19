import 'package:caronas_usp/app/models/passenger.dart';
import 'package:equatable/equatable.dart';

abstract class AceitarEvent extends Equatable {
  final List? _props;

  AceitarEvent([this._props]);

  @override
  List<Object> get props => _props as List<Object>;
}

class PassengerAccepted extends AceitarEvent {
  Passenger passenger;

  PassengerAccepted(this.passenger) : super([passenger]);
}

class PassengerRejected extends AceitarEvent {
  Passenger passenger;

  PassengerRejected(this.passenger) : super([passenger]);
}
