import 'package:equatable/equatable.dart';

abstract class HistoricoEvent extends Equatable {
  final List? _props;

  HistoricoEvent([this._props]);

  @override
  List<Object> get props => _props as List<Object>;
}

class FetchHistorico extends HistoricoEvent {

  FetchHistorico() : super();
}
