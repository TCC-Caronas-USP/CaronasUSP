import 'package:equatable/equatable.dart';

abstract class PegarState extends Equatable {
  final List _props;

  const PegarState(this._props);

  @override
  List get props => _props;
}

class PegarLoading extends PegarState {
  PegarLoading() : super([]);
}

class PegarLoaded extends PegarState {
  PegarLoaded() : super([]);
}
