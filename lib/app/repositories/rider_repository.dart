import 'dart:async';

import 'package:caronas_usp/app/models/rider.dart';
import 'package:caronas_usp/app/models/vehicle.dart';

import 'network/rider_requester.dart';

class RiderRepository {
  Future<Rider> getRider() async {
    return RiderRequester.getRider();
  }

  Future<bool> updateRiderInfo(Rider rider) async {
    // return RiderRequester.updateRiderInfo();
    await Future.delayed(const Duration(seconds: 1));

    print(rider.toString());
    print(rider.toJson());

    return true;
  }

  Future<bool> insertVehicleInfo(Vehicle vehicle) async {
    // return RiderRequester.updateRiderInfo();
    await Future.delayed(const Duration(seconds: 1));

    print(vehicle.toString());
    print(vehicle.toJson());

    return true;
  }

  Future<bool> updateVehicleInfo(Vehicle vehicle) async {
    // return RiderRequester.updateRiderInfo();
    await Future.delayed(const Duration(seconds: 1));

    print(vehicle.toString());
    print(vehicle.toJson());

    return true;
  }

  Future<bool> checkIfRiderExists() async {
    try {
      Rider rider = await RiderRequester.getRider();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> registerRider(Rider rider) async {
    Map<String, dynamic> params = rider.toJson();
    await RiderRequester.postRider(params);
  }
}
