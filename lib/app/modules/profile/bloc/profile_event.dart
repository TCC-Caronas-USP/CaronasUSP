import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class ProfileEvent extends Equatable {
  final List? _props;

  ProfileEvent([this._props]);

  @override
  List<Object> get props => _props as List<Object>;
}

class FetchUserInfo extends ProfileEvent {
  final String email;

  FetchUserInfo(this.email) : super([email]);
}
