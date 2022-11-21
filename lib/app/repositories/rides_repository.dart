import 'dart:async';
import 'package:caronas_usp/app/models/location.dart';
import 'package:caronas_usp/app/models/ride.dart';
import 'package:caronas_usp/app/repositories/network/rides_requester.dart';

class RidesRepository {
  List<List<Ride>> rideDates(List<Ride> userOfferedRides) {
    List<String> userOfferedRideDates = [];
    for (final ride in userOfferedRides) {
      var rideDate = ride.endTime.toString().substring(0, 10);
      userOfferedRideDates.add(rideDate);
    }
    userOfferedRideDates = userOfferedRideDates.toSet().toList()..sort();

    List<List<Ride>> ridesOfTheSameDay = [];
    for (final userOfferedRideDate in userOfferedRideDates) {
      List<Ride> rideOfTheSameDay = [];
      for (final ride in userOfferedRides) {
        if (userOfferedRideDate ==
            ride.endTime.toString().substring(0, 10)) {
          rideOfTheSameDay.add(ride);
        }
      }
      ridesOfTheSameDay.add(rideOfTheSameDay);
    }
    return ridesOfTheSameDay;
  }

  Future<List<List<Ride>>> getOfferedRides() async {
    return rideDates(await RideRequester.getRides());
  }

  Future<Ride> getRide(rideId) async {
    return RideRequester.getRide(rideId);
  }

  Future<List<List<Ride>>> getUserOfferedRides() async {
    return rideDates(await RideRequester.getRidesAsDriver());
  }

  Future<bool> createRide(Ride ride) async {
    Map<String, dynamic> params = ride.toJson();
    return RideRequester.postRide(params);
  }

  static List<Ride> myOfferedRides = <Ride>[
  ];

  static List<Ride> offeredRides = <Ride>[];

  static List<Ride> myRides = <Ride>[];

  Future<bool> cancelRide(rideId) async {
    await Future.delayed(const Duration(seconds: 1));

    print(rideId);

    return true;
  }

  Future<bool> enterRide(Ride ride, Location newLocation) async {
    await Future.delayed(const Duration(seconds: 1));

    Map<String, dynamic> params = {
      "ride": 3,
      "meeting_point": {"address": "Rua ABCDE", "lat": -10.00, "lon": -20.00}
    };
    // await RidesRequester.postRider(params);

    print(ride.toJson());
    for (var l in ride.locations) {
      print(l.toJson());
    }

    return true;
  }

  Future<List<List<Ride>>> getMyRides() async {
    // return UserGraphQLRequester.getMyRides(); TODO implementar requester
    await Future.delayed(const Duration(seconds: 1));

    return rideDates(myRides);
  }
}
