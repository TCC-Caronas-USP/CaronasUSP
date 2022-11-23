import 'dart:async';

import 'package:caronas_usp/app/models/rider.dart';
import 'package:caronas_usp/app/models/vehicle.dart';

import 'network/rider_requester.dart';
import 'network/vehicle_requester.dart';

class RiderRepository {
  Future<Rider> getRider() async {
    return RiderRequester.getRider();
  }

  Future<bool> updateRiderInfo(Rider rider) async {
    Map<String, dynamic> params = rider.toJson();
    return RiderRequester.patchRider(params);
  }

  Future<bool> insertVehicleInfo(Vehicle vehicle) async {
    Map<String, dynamic> params = vehicle.toJson();
    return VehicleRequester.postVehicle(params);
  }

  Future<bool> updateVehicleInfo(Vehicle vehicle) async {
    Map<String, dynamic> params = vehicle.toJson();
    return VehicleRequester.patchVehicle(params);
  }

  Future<bool> checkIfRiderExists() async {
    try {
      Rider rider = await RiderRequester.getRider();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<Rider> registerRider(Rider rider) async {
    Map<String, dynamic> params = rider.toJson();
    return RiderRequester.postRider(params);
  }
}
