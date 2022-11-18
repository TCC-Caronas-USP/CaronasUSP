import 'package:caronas_usp/app/models/rider.dart';
import 'package:equatable/equatable.dart';

abstract class CriarState extends Equatable {
  final List _props;

  const CriarState(this._props);

  @override
  List get props => _props;
}

class CreateLoading extends CriarState {
  CreateLoading() : super([]);
}

class Creating extends CriarState {
  final Rider rider;

  Creating(this.rider) : super([rider]);
}

class Created extends CriarState {
  final bool created;

  Created(this.created) : super([created]);
}
