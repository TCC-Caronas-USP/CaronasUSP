import 'package:caronas_usp/model/location.dart';
import 'package:caronas_usp/model/passenger.dart';
import 'package:caronas_usp/model/rider.dart';

import 'package:json_annotation/json_annotation.dart';

part 'ride.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Ride {
  final String id;
  final Rider driver;
  final DateTime arrivalTime;
  final Location destination;
  final DateTime departureTime;
  final Location origin;
  final double price;
  final int totalOccupation;
  final int currentOccupation;
  final List<Passenger> passengers;

  factory Ride.fromJson(Map<String, dynamic> json) => _$RideFromJson(json);

  Map<String, dynamic> toJson() => _$RideToJson(this);

  Ride({
    required this.id,
    required this.driver,
    required this.arrivalTime,
    required this.destination,
    required this.departureTime,
    required this.origin,
    required this.price,
    required this.totalOccupation,
    required this.currentOccupation,
    required this.passengers,
  });
}
