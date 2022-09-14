import 'package:caronas_usp/model/user.dart';

class Ride {
  final String rideId;
  final User driverUsers;
  final String rideDestinyDatetime; // tentei colocar como datetime, mas não consegui
  final String destinyPlace;
  final String rideSourceDatetime;
  final String sourcePlace;
  final double price;
  final int totalOccupation;
  final int currentOccupation;
  final List<User> consumersUsers;

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
  });
}