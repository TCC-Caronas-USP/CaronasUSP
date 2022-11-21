import 'package:caronas_usp/app/models/passenger.dart';
import 'network/passenger_requester.dart';

class PassengerRepository {
  Future<bool> acceptPassenger(Passenger passenger) async {
    return PassengerRequester.accept(passenger);
  }

  Future<bool> rejectPassenger(Passenger passenger) async {
    return PassengerRequester.reject(passenger);
  }
}