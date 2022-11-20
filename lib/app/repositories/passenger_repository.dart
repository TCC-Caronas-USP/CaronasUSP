import 'package:caronas_usp/app/models/passenger.dart';

class PassengerRepository {
  Future<bool> acceptPassenger(Passenger passenger) async {
    await Future.delayed(const Duration(seconds: 1));

    print("aceito");
    print(passenger.toJson());

    return true;
  }

  Future<bool> rejectPassenger(Passenger passenger) async {
    await Future.delayed(const Duration(seconds: 1));

    print("rejeitado");
    print(passenger.toJson());

    return true;
  }
}