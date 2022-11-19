import 'package:caronas_usp/app/models/ride.dart';
import 'package:equatable/equatable.dart';

abstract class CriarEvent extends Equatable {
  final List? _props;

  CriarEvent([this._props]);

  @override
  List<Object> get props => _props as List<Object>;
}

class FetchCreating extends CriarEvent {

  FetchCreating() : super();
}

class FetchCreate extends CriarEvent {
  final Ride ride;

  FetchCreate(this.ride) : super([ride]);
}
