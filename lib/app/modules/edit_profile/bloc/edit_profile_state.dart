import 'package:caronas_usp/model/rider.dart';
import 'package:equatable/equatable.dart';

abstract class EditProfileState extends Equatable {
  final List _props;

  const EditProfileState(this._props);

  @override
  List get props => _props;
}

class EditProfileLoading extends EditProfileState {
  EditProfileLoading() : super([]);
}

class EditProfileLoaded extends EditProfileState {
  final Rider user;

  EditProfileLoaded(this.user) : super([user]);
}

class EditedProfile extends EditProfileState {
  final bool updated;

  EditedProfile(this.updated) : super([updated]);
}

class EditedVehicle extends EditProfileState {
  final bool updated;

  EditedVehicle(this.updated) : super([updated]);
}
