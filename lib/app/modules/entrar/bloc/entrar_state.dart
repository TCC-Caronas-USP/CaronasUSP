import 'package:equatable/equatable.dart';

abstract class EntrarState extends Equatable {
  final List _props;

  const EntrarState(this._props);

  @override
  List get props => _props;
}

class Entering extends EntrarState {
  Entering() : super([]);
}

class Suggesting extends EntrarState {
  Suggesting() : super([]);
}

class Suggested extends EntrarState {
  final bool sugested;

  Suggested(this.sugested) : super([sugested]);
}