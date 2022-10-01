import 'package:equatable/equatable.dart';

abstract class PegarEvent extends Equatable {
  final List? _props;

  PegarEvent([this._props]);

  @override
  List<Object> get props => _props as List<Object>;
}

class FetchPegar extends PegarEvent {
  FetchPegar() : super();
}
