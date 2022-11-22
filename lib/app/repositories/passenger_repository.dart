import 'package:caronas_usp/app/models/passenger.dart';
import 'network/passenger_requester.dart';

class PassengerRepository {
  Future<bool> postPassenger(Passenger passenger) async {
    Map<String, dynamic> params = passenger.toJson();
    return PassengerRequester.post(params);
  }

  Future<bool> acceptPassenger(Passenger passenger) async {
    return PassengerRequester.accept(passenger);
  }

  Future<bool> rejectPassenger(Passenger passenger) async {
    return PassengerRequester.reject(passenger);
  }

  Future<bool> exitRide(Passenger passenger) async {
    return PassengerRequester.deletePassenger(passenger);
  }
}