import 'package:caronas_usp/model/location.dart';
import 'package:caronas_usp/model/rider.dart';

import 'package:json_annotation/json_annotation.dart';

part 'ride.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Ride {
  final String rideId;
  final Rider driverUsers;
  final String rideDestinyDatetime; // tentei colocar como datetime, mas não consegui
  final String destinyPlace;
  final String rideSourceDatetime;
  final String sourcePlace;
  final double price;
  final int totalOccupation;
  final int currentOccupation;
  final List<Rider> consumersUsers;
  final List<Location> locations;
  final String? myRideStatus;

  factory Ride.fromJson(Map<String, dynamic> json) => _$RideFromJson(json);

  Map<String, dynamic> toJson() => _$RideToJson(this);

  const Ride({
    required this.rideId,
    required this.driverUsers,
    required this.rideDestinyDatetime,
    required this.destinyPlace,
    required this.rideSourceDatetime,
    required this.sourcePlace,
    required this.price,
    required this.totalOccupation,
    required this.currentOccupation,
    required this.consumersUsers,
    required this.locations,
    this.myRideStatus,
  });
}
