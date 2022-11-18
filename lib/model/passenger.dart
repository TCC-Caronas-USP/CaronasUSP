import 'package:caronas_usp/model/location.dart';

import 'package:json_annotation/json_annotation.dart';

part 'passenger.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Passenger {
  final String id;
  final String rideId;
  final String riderId;
  final String riderName;
  final Location meetingPoint;

  factory Passenger.fromJson(Map<String, dynamic> json) => _$PassengerFromJson(json);

  Map<String, dynamic> toJson() => _$PassengerToJson(this);

  Passenger({
    required this.id,
    required this.rideId,
    required this.riderId,
    required this.riderName,
    required this.meetingPoint,
  });
}
