import 'package:equatable/equatable.dart';

abstract class AceitarState extends Equatable {
  final List _props;

  const AceitarState(this._props);

  @override
  List get props => _props;
}

class ValidatingPassenger extends AceitarState {
  ValidatingPassenger() : super([]);
}

class PassengerValidated extends AceitarState {
  final bool validated;

  PassengerValidated(this.validated) : super([validated]);
}
