import 'dart:async';

import 'package:caronas_usp/model/ride.dart';
import 'package:caronas_usp/model/user.dart';

class RidesRepository {
  Future<List<List<Ride>>> getUserOfferedRides() async {
    // return UserGraphQLRequester.getUserOfferedRides(email); TODO implementar requester
    await Future.delayed(
        const Duration(seconds: 1)); // TODO remover sleep e user mock

    const user = User(
      imagePath:
      "https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80",
      name: "João Souza",
      email: "joao.souza@usp.br",
      cpf: "000.000.000-00",
      telefone: "(99) 99999-9999",
      instituto: "FAU - Arquitetura",
      veiculoModelo: "Ford Ka",
      veiculoCor: "Prata",
      veiculoMarca: "Ford",
      veiculoPlaca: "ABC1D34",
      caronasUtilizadas: 10,
      caronasRealizadas: 0,
      ranking: 4.9,
    );

    const myOfferedRides = <Ride>[
      Ride(
          driverUsers: user,
          rideDate: '2022-07-20 17:00:00',
          destinyPlace: "CEPEUSP",
          sourcePlace: "Osasco",
          price: 4,
          totalOccupation: 4,
          currentOccupation: 2),
      Ride(
          driverUsers: user,
          rideDate: '2022-07-20 20:30:00',
          destinyPlace: "Osasco",
          sourcePlace: "CEPEUSP",
          price: 4,
          totalOccupation: 4,
          currentOccupation: 0),
      Ride(
          driverUsers: user,
          rideDate: '2022-07-21 08:00:00',
          destinyPlace: "POLI",
          sourcePlace: "Osasco",
          price: 5,
          totalOccupation: 4,
          currentOccupation: 1),
      Ride(
          driverUsers: user,
          rideDate: '2022-07-21 17:00:00',
          destinyPlace: "Osasco",
          sourcePlace: "POLI",
          price: 5,
          totalOccupation: 4,
          currentOccupation: 2),
      Ride(
          driverUsers: user,
          rideDate: '2022-07-22 10:00:00',
          destinyPlace: "POLI",
          sourcePlace: "Osasco",
          price: 6.50,
          totalOccupation: 4,
          currentOccupation: 0),
    ];

    List<List<Ride>> rideDates(List<Ride> userOfferedRides) {
      List<String> userOfferedRideDates = [];
      for (final ride in userOfferedRides) {
        var rideDate = ride.rideDate.substring(0, 10);
        userOfferedRideDates.add(rideDate);
      }
      userOfferedRideDates = userOfferedRideDates.toSet().toList()..sort();

      List<List<Ride>> ridesOfTheSameDay = [];
      for (final userOfferedRideDate in userOfferedRideDates) {
        List<Ride> rideOfTheSameDay = [];
        for (final ride in userOfferedRides) {
          if (userOfferedRideDate == ride.rideDate.substring(0, 10)) {
            rideOfTheSameDay.add(ride);
          }
        }
        ridesOfTheSameDay.add(rideOfTheSameDay);
      }

      return ridesOfTheSameDay;
    }

    return rideDates(myOfferedRides);
  }
}
