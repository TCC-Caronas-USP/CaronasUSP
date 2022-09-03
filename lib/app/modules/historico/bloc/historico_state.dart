import 'package:equatable/equatable.dart';

abstract class HistoricoState extends Equatable {
  final List _props;

  const HistoricoState(this._props);

  @override
  List get props => _props;
}

class HistoricoLoading extends HistoricoState {
  HistoricoLoading() : super([]);
}

class HistoricoLoaded extends HistoricoState {
  HistoricoLoaded() : super([]);
}
