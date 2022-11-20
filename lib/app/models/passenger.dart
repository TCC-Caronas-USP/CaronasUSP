import 'package:caronas_usp/app/core/constants.dart';
import 'package:caronas_usp/app/models/location.dart';

import 'package:json_annotation/json_annotation.dart';

part 'passenger.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Passenger {
  int id;
  final int rideId;
  final int riderId;
  final String riderName;
  final String riderTelefone;
  final String riderInstituto;
  final String riderImagePath;
  final Location meetingPoint;
  final RidePassengerStatus status;

  factory Passenger.fromJson(Map<String, dynamic> json) =>
      _$PassengerFromJson(json);

  Map<String, dynamic> toJson() => _$PassengerToJson(this);

  Passenger(
      {required this.id,
      required this.rideId,
      required this.riderId,
      required this.riderName,
      required this.riderTelefone,
      required this.riderInstituto,
      required this.riderImagePath,
      required this.meetingPoint,
      required this.status});
}
