import 'package:caronas_usp/model/rider.dart';
import 'package:equatable/equatable.dart';

abstract class ProfileState extends Equatable {
  final List _props;

  const ProfileState(this._props);

  @override
  List get props => _props;
}

class ProfileLoading extends ProfileState {
  ProfileLoading() : super([]);
}

class ProfileLoaded extends ProfileState {
  final Rider user;

  ProfileLoaded(this.user) : super([user]);
}
