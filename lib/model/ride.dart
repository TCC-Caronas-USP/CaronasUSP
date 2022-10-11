import 'package:caronas_usp/model/rider.dart';

class Ride {
  final Rider driverUsers;
  final String rideDate; // tentei colocar como datetime, mas não consegui
  final String destinyPlace;
  final String sourcePlace;
  final double price;
  final int totalOccupation;
  final int currentOccupation;

  const Ride({
    required this.driverUsers,
    required this.rideDate,
    required this.destinyPlace,
    required this.sourcePlace,
    required this.price,
    required this.totalOccupation,
    required this.currentOccupation,
  });
}