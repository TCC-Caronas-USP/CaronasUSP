import 'package:equatable/equatable.dart';

abstract class CriarState extends Equatable {
  final List _props;

  const CriarState(this._props);

  @override
  List get props => _props;
}

class Creating extends CriarState {
  Creating() : super([]);
}

class Created extends CriarState {
  final bool created;

  Created(this.created) : super([created]);
}
