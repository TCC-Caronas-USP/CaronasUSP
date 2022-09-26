import 'dart:async';

import 'package:caronas_usp/model/location.dart';
import 'package:caronas_usp/model/ride.dart';
import 'package:caronas_usp/model/user.dart';

const driverUser = User(
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

const consumerUser1 = User(
  imagePath:
      "https://images.unsplash.com/photo-1542740348-39501cd6e2b4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
  name: "Maria Clara",
  email: "maria.clara@usp.br",
  cpf: "000.000.000-00",
  telefone: "(99) 99999-9999",
  instituto: "FFLCH - História",
  veiculoModelo: "",
  veiculoCor: "",
  veiculoMarca: "",
  veiculoPlaca: "",
  caronasUtilizadas: 23,
  caronasRealizadas: 0,
  ranking: 4.8,
);

const consumerUser2 = User(
  imagePath:
      "https://images.unsplash.com/photo-1564564321837-a57b7070ac4f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1176&q=80",
  name: "Marcos Antonio",
  email: "marcos.antonio@usp.br",
  cpf: "000.000.000-00",
  telefone: "(99) 99999-9999",
  instituto: "POLI - Engenharia Civil",
  veiculoModelo: "",
  veiculoCor: "",
  veiculoMarca: "",
  veiculoPlaca: "",
  caronasUtilizadas: 5,
  caronasRealizadas: 0,
  ranking: 5.0,
);

const myOfferedRides = <Ride>[
  Ride(
      rideId: '0000-0000',
      driverUsers: driverUser,
      rideDestinyDatetime: '2022-07-20 17:00:00',
      destinyPlace: "CEPEUSP",
      rideSourceDatetime: '2022-07-20 15:30:00',
      sourcePlace: "Osasco",
      price: 4,
      totalOccupation: 4,
      currentOccupation: 2,
      consumersUsers: [
        consumerUser1,
        consumerUser2
      ],
      locations: [
        Location(
            id: "0",
            description: "Centro, Osasco",
            lat: -23.52757364623115,
            lon: -46.775917073927005),
        Location(
            id: "1",
            description: "Ginásio Esportivo José Liberatti, Osasco",
            lat: -23.522968147439226,
            lon: -46.77195689128132),
        Location(
            id: "2",
            description: "Shopping União, Osasco",
            lat: -23.540725715455537,
            lon: -46.76624979719036),
        Location(
            id: "3",
            description: "CEPE USP, Cidade Universitária",
            lat: -23.56112651802629,
            lon: -46.71734667392638),
      ]),
  Ride(
      rideId: '0000-0001',
      driverUsers: driverUser,
      rideDestinyDatetime: '2022-07-20 20:30:00',
      destinyPlace: "Osasco",
      rideSourceDatetime: '2022-07-20 19:00:00',
      sourcePlace: "CEPEUSP",
      price: 4,
      totalOccupation: 4,
      currentOccupation: 0,
      consumersUsers: [],
      locations: [
        Location(
            id: "0",
            description: "CEPE USP, Cidade Universitária",
            lat: -23.56112651802629,
            lon: -46.71734667392638),
        Location(
            id: "1",
            description: "Centro, Osasco",
            lat: -23.52757364623115,
            lon: -46.775917073927005),
      ]),
  Ride(
      rideId: '0000-0002',
      driverUsers: driverUser,
      rideDestinyDatetime: '2022-07-21 08:00:00',
      destinyPlace: "POLI",
      rideSourceDatetime: '2022-07-21 06:30:00',
      sourcePlace: "Osasco",
      price: 5,
      totalOccupation: 4,
      currentOccupation: 1,
      consumersUsers: [
        consumerUser1
      ],
      locations: [
        Location(
            id: "0",
            description: "Centro, Osasco",
            lat: -23.52757364623115,
            lon: -46.775917073927005),
        Location(
            id: "1",
            description: "Shopping União, Osasco",
            lat: -23.540725715455537,
            lon: -46.76624979719036),
        Location(
            id: "2",
            description: "Escola Politécnia da USP, Cidade Universitária",
            lat: -23.556977524989904,
            lon: -46.73021254499231),
      ]),
  Ride(
      rideId: '0000-0003',
      driverUsers: driverUser,
      rideDestinyDatetime: '2022-07-21 17:00:00',
      destinyPlace: "Osasco",
      rideSourceDatetime: '2022-07-21 15:30:00',
      sourcePlace: "POLI",
      price: 5,
      totalOccupation: 4,
      currentOccupation: 2,
      consumersUsers: [
        consumerUser1,
        consumerUser2
      ],
      locations: [
        Location(
            id: "0",
            description: "Escola Politécnia da USP, Cidade Universitária",
            lat: -23.556977524989904,
            lon: -46.73021254499231),
        Location(
            id: "1",
            description: "Ginásio Esportivo José Liberatti, Osasco",
            lat: -23.522968147439226,
            lon: -46.77195689128132),
        Location(
            id: "2",
            description: "Shopping União, Osasco",
            lat: -23.540725715455537,
            lon: -46.76624979719036),
        Location(
            id: "3",
            description: "Centro, Osasco",
            lat: -23.52757364623115,
            lon: -46.775917073927005),

      ]),
  Ride(
      rideId: '0000-0004',
      driverUsers: driverUser,
      rideDestinyDatetime: '2022-07-22 10:00:00',
      destinyPlace: "POLI",
      rideSourceDatetime: '2022-07-22 08:30:00',
      sourcePlace: "Osasco",
      price: 6.50,
      totalOccupation: 4,
      currentOccupation: 0,
      consumersUsers: [],
      locations: [
        Location(
            id: "0",
            description: "Centro, Osasco",
            lat: -23.52757364623115,
            lon: -46.775917073927005),
        Location(
            id: "1",
            description: "Escola Politécnia da USP, Cidade Universitária",
            lat: -23.556977524989904,
            lon: -46.73021254499231),
      ]),
];

class RidesRepository {
  Future<List<List<Ride>>> getUserOfferedRides() async {
    // return UserGraphQLRequester.getUserOfferedRides(email); TODO implementar requester
    await Future.delayed(
        const Duration(seconds: 1)); // TODO remover sleep e user mock

    List<List<Ride>> rideDates(List<Ride> userOfferedRides) {
      List<String> userOfferedRideDates = [];
      for (final ride in userOfferedRides) {
        var rideDate = ride.rideDestinyDatetime.substring(0, 10);
        userOfferedRideDates.add(rideDate);
      }
      userOfferedRideDates = userOfferedRideDates.toSet().toList()..sort();

      List<List<Ride>> ridesOfTheSameDay = [];
      for (final userOfferedRideDate in userOfferedRideDates) {
        List<Ride> rideOfTheSameDay = [];
        for (final ride in userOfferedRides) {
          if (userOfferedRideDate ==
              ride.rideDestinyDatetime.substring(0, 10)) {
            rideOfTheSameDay.add(ride);
          }
        }
        ridesOfTheSameDay.add(rideOfTheSameDay);
      }

      return ridesOfTheSameDay;
    }

    return rideDates(myOfferedRides);
  }

  Future<Ride?> getRide(rideId) async {
    await Future.delayed(const Duration(seconds: 1));

    Ride? ride;
    for (var myRide in myOfferedRides) {
      if (myRide.rideId == rideId) {
        ride = myRide;
      }
    }

    return ride;
  }
}
