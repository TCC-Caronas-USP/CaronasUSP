import 'package:caronas_usp/app/models/rider.dart';
import 'package:equatable/equatable.dart';

abstract class EditProfileEvent extends Equatable {
  final List? _props;

  EditProfileEvent([this._props]);

  @override
  List<Object> get props => _props as List<Object>;
}

class FetchRiderInfo extends EditProfileEvent {
  FetchRiderInfo() : super([]);
}

class UpdateRiderInfo extends EditProfileEvent {
  final Rider rider;

  UpdateRiderInfo(this.rider) : super([rider]);
}

class UpdateVehicleInfo extends EditProfileEvent {
  final Vehicle vehicle;

  UpdateVehicleInfo(this.vehicle) : super([vehicle]);
}

class InsertVehicleInfo extends EditProfileEvent {
  final Vehicle vehicle;

  InsertVehicleInfo(this.vehicle) : super([vehicle]);
}
