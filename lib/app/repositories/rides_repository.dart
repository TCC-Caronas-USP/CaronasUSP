import 'dart:async';
import 'package:caronas_usp/app/core/constants.dart';
import 'package:caronas_usp/app/models/location.dart';
import 'package:caronas_usp/app/models/passenger.dart';
import 'package:caronas_usp/app/models/ride.dart';
import 'package:caronas_usp/app/models/rider.dart';
import 'package:caronas_usp/app/models/vehicle.dart';

class RidesRepository {
  List<List<Ride>> rideDates(List<Ride> userOfferedRides) {
    List<String> userOfferedRideDates = [];
    for (final ride in userOfferedRides) {
      var rideDate = ride.arrivalTime.toString().substring(0, 10);
      userOfferedRideDates.add(rideDate);
    }
    userOfferedRideDates = userOfferedRideDates.toSet().toList()..sort();

    List<List<Ride>> ridesOfTheSameDay = [];
    for (final userOfferedRideDate in userOfferedRideDates) {
      List<Ride> rideOfTheSameDay = [];
      for (final ride in userOfferedRides) {
        if (userOfferedRideDate ==
            ride.arrivalTime.toString().substring(0, 10)) {
          rideOfTheSameDay.add(ride);
        }
      }
      ridesOfTheSameDay.add(rideOfTheSameDay);
    }
    return ridesOfTheSameDay;
  }

  Rider driverUser = Rider(
      imagePath:
          "https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80",
      name: "João Souza",
      email: "joao.souza@usp.br",
      telefone: "(99) 99999-9999",
      instituto: "FAU",
      curso: 'Arquitetura',
      ano: 2019,
      caronasPassageiro: 10,
      caronasMotorista: 0,
      ranking: 4.9,
      vehicles: [
        Vehicle(
            model: 'Ka', color: 'Prata', brand: 'Ford', licensePlate: 'ABC1D34')
      ]);

  Rider consumerUser1 = Rider(
      imagePath:
          "https://images.unsplash.com/photo-1542740348-39501cd6e2b4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
      name: "Maria Clara",
      email: "maria.clara@usp.br",
      telefone: "(99) 99999-9999",
      instituto: "FFLCH",
      curso: 'História',
      ano: 2019,
      caronasPassageiro: 23,
      caronasMotorista: 0,
      ranking: 4.8,
      vehicles: []);

  Rider consumerUser2 = Rider(
      imagePath:
          "https://images.unsplash.com/photo-1542740348-39501cd6e2b4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
      name: "Maria Clara",
      email: "maria.clara@usp.br",
      telefone: "(99) 99999-9999",
      instituto: "FFLCH",
      curso: 'História',
      ano: 2019,
      caronasPassageiro: 23,
      caronasMotorista: 0,
      ranking: 4.8,
      vehicles: []);

  static List<Ride> myOfferedRides = <Ride>[
    Ride(
        id: 1,
        driver: Rider(
            imagePath:
                "https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80",
            name: "João Souza",
            email: "joao.souza@usp.br",
            telefone: "(99) 99999-9999",
            instituto: "FAU",
            curso: 'Arquitetura',
            ano: 2019,
            caronasPassageiro: 10,
            caronasMotorista: 0,
            ranking: 4.9,
            vehicles: [
              Vehicle(
                  model: 'Ka',
                  color: 'Prata',
                  brand: 'Ford',
                  licensePlate: 'ABC1D34')
            ]),
        arrivalTime: DateTime(2022, 11, 25, 6, 30),
        destination: Location(
            description: "Parque Ibirapuera, São Paulo, Brazil",
            lat: -23.588306,
            lon: -46.658794),
        departureTime: DateTime(2022, 11, 25, 8),
        origin: Location(
            description: "Centro Histórico da Cidade de Itu, Itu, SP, Brazil",
            lat: -23.260085,
            lon: -47.300106),
        price: 8.50,
        maxNumPassengers: 4,
        passengers: [
          Passenger(
              id: 101,
              rideId: 100,
              riderId: 100,
              riderName: "Maria Clara",
              riderInstituto: "FFLCH",
              riderImagePath:
                  "https://images.unsplash.com/photo-1542740348-39501cd6e2b4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
              meetingPoint: Location(
                  description:
                      "Expresso Aeroporto - Guarulhos, São Paulo, Brazil",
                  lat: -23.535298,
                  lon: -46.634253),
              status: RidePassengerStatus.approved),
          Passenger(
              id: 101,
              rideId: 100,
              riderId: 100,
              riderName: "João Souza",
              riderInstituto: "FAU",
              riderImagePath:
                  "https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80",
              meetingPoint: Location(
                  description: "Shopping Cidade Sorocaba, Sorocaba, SP, Brazil",
                  lat: -23.456768,
                  lon: -47.483346),
              status: RidePassengerStatus.approved)
        ])
  ];

  static List<Ride> offeredRides = <Ride>[];

  Future<List<List<Ride>>> getUserOfferedRides() async {
    // return UserGraphQLRequester.getUserOfferedRides(email); TODO implementar requester
    await Future.delayed(
        const Duration(seconds: 1)); // TODO remover sleep e user mock
    return rideDates(myOfferedRides);
  }

  Future<List<List<Ride>>> getOfferedRides() async {
    // return UserGraphQLRequester.getOfferedRides(); TODO implementar requester
    await Future.delayed(
        const Duration(seconds: 1) // TODO remover sleep e user mock
        );
    return rideDates(offeredRides);
  }

  static List<Ride> myRides = <Ride>[];

  Future<Ride?> getRide(rideId) async {
    await Future.delayed(const Duration(seconds: 1));
    Ride? ride;
    ride = (myOfferedRides + offeredRides)
        .firstWhere((element) => element.id == rideId);

    ride = (myOfferedRides + offeredRides)
        .firstWhere((element) => element.id == rideId);
    return ride;
  }

  Future<bool> cancelRide(rideId) async {
    await Future.delayed(const Duration(seconds: 1));

    print(rideId);

    return true;
  }

  Future<bool?> createRide(Ride ride) async {
    await Future.delayed(const Duration(seconds: 1));

    print(ride.toString());
    print(ride.toJson());
    print(ride.driver.toJson());
    print(ride.origin.toJson());
    print(ride.destination.toJson());
    for (var p in ride.passengers) {
      print(p.toJson());
      print(p.meetingPoint.toJson());
    }

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
