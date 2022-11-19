import 'package:caronas_usp/app/core/constants.dart';
import 'package:caronas_usp/app/models/location.dart';
import 'package:caronas_usp/app/models/passenger.dart';
import 'package:caronas_usp/app/models/rider.dart';
import 'package:geolocator/geolocator.dart';

import 'package:json_annotation/json_annotation.dart';

part 'ride.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Ride {
  int id;
  final Rider driver;
  final DateTime arrivalTime;
  final Location destination;
  final DateTime departureTime;
  final Location origin;
  final double price;
  final int maxNumPassengers;
  List<Passenger> passengers;

  bool isPassenger(Rider rider) {
    int riderId = rider.id!;
    return passengers.any((passenger) => passenger.riderId == riderId);
  }

  RidePassengerStatus getStatus(Rider rider) {
    int riderId = rider.id!;
    return passengers
        .singleWhere((passenger) => passenger.riderId == riderId)
        .status;
  }

  double distanceFromOriginLocation(Location meetingPointing) {
    double distance = Geolocator.distanceBetween(
        origin.lon,
        origin.lat,
        meetingPointing.lon,
        meetingPointing.lat) /
        1000;
    return distance;
  }

  List<Map<String, dynamic>> locationWithDistance({newPasseger}) {
    // make this an empty list by intializing with []
    List<Map<String, dynamic>> locationListWithDistance = [];

    // associate location with distance
    for(var passenger in passengers) {
      if (passenger.status == RidePassengerStatus.approved) {
        Location passengerMeetingPoint = passenger.meetingPoint;
        double distance = distanceFromOriginLocation(passengerMeetingPoint);
        locationListWithDistance.add({
          'location': passengerMeetingPoint,
          'distance': distance,
        });
      }
    }
    if (newPasseger != null) {
      Location passengerMeetingPoint = newPasseger.meetingPoint;
      double distance = distanceFromOriginLocation(passengerMeetingPoint);
      locationListWithDistance.add({
        'location': passengerMeetingPoint,
        'distance': distance,
      });
    }

    return locationListWithDistance;
  }

  List<Map<String, dynamic>> sortLocationListWithDistance(locationListWithDistance) {
    // sort by distance
    locationListWithDistance.sort((a, b) {
      double d1 = a['distance'];
      double d2 = b['distance'];
      if (d1 > d2) {
        return 1;
      } else if (d1 < d2) {
        return -1;
      } else {
        return 0;
      }
    });

    return locationListWithDistance;
  }

  List<Location> get locations {

    List<Map<String, dynamic>> locationListWithDistance = locationWithDistance();

    List<Map<String, dynamic>> sortedLocationListWithDistance = sortLocationListWithDistance(locationListWithDistance);

    List<Location> rideLocations = [origin];
    for (var meetPointing in sortedLocationListWithDistance) {
      rideLocations.add(meetPointing['location']);
    }
    rideLocations.add(destination);

    return rideLocations;
  }

  List<Location> getLocationsWithNewSuggestion(Passenger newPassager) {

    List<Map<String, dynamic>> locationListWithDistance = locationWithDistance(newPasseger: newPassager);

    List<Map<String, dynamic>> sortedLocationListWithDistance = sortLocationListWithDistance(locationListWithDistance);

    List<Location> rideLocations = [origin];
    for (var meetPointing in sortedLocationListWithDistance) {
      rideLocations.add(meetPointing['location']);
    }
    rideLocations.add(destination);

    return rideLocations;
  }

  int get currentNumPassengers => passengers.length;

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
    required this.maxNumPassengers,
    required this.passengers,
  });
}
