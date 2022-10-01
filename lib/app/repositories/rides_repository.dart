import 'dart:async';

import 'package:caronas_usp/model/location.dart';
import 'package:caronas_usp/model/ride.dart';
import 'package:caronas_usp/model/user.dart';

class RidesRepository {
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

  Future<List<List<Ride>>> getUserOfferedRides() async {
    // return UserGraphQLRequester.getUserOfferedRides(email); TODO implementar requester
    await Future.delayed(
        const Duration(seconds: 1)); // TODO remover sleep e user mock

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
          destinyPlace:
          "CEPEUSP - Centro de Práticas Esportivas da USP, Prç. Prof. Rubião Meira, 61 - Vila Universitaria, São Paulo - SP, 05508-110",
          rideSourceDatetime: '2022-07-20 15:30:00',
          sourcePlace: "Osascoooooooooooooooooooooooooooo",
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

    return rideDates(myOfferedRides);
  }

  Future<List<List<Ride>>> getOfferedRides() async {
    // return UserGraphQLRequester.getOfferedRides(); TODO implementar requester
    await Future.delayed(
        const Duration(seconds: 1) // TODO remover sleep e user mock
    );

    const offeredRides = <Ride>[
      Ride(
          driverUsers: User(
            imagePath:
            "https://images.unsplash.com/photo-1487412720507-e7ab37603c6f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1471&q=80",
            name: "Ana Paula Martins",
            email: "ana.paula@usp.br",
            cpf: "519.595.340-68",
            telefone: "(11) 78640-2609",
            instituto: "FAU",
            veiculoModelo: "Siena",
            veiculoCor: "Preto",
            veiculoMarca: "Fiat",
            veiculoPlaca: "JTN-7099",
            caronasUtilizadas: 34,
            caronasRealizadas: 12,
            ranking: 4.6,
          ),
          rideDestinyDatetime: '2022-09-24 17:35:00',
          destinyPlace: "FAU USP",
          rideSourceDatetime: '2022-07-22 08:30:00',
          sourcePlace: "Rua Nova Hamburgo - Ipiranga",
          price: 4.50,
          totalOccupation: 4,
          currentOccupation: 2,
          consumersUsers: [],
          locations: [],
      ),
      Ride(
          driverUsers: User(
            imagePath:
            "https://images.unsplash.com/photo-1512361436605-a484bdb34b5f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80",
            name: "Gabriela Araújo",
            email: "gabriela.araujo@usp.br",
            cpf: "327.480.260-39",
            telefone: "(11) 16236-9157",
            instituto: "POLI",
            veiculoModelo: "Mini Cooper",
            veiculoCor: "Cinza",
            veiculoMarca: "Rover",
            veiculoPlaca: "JNM-0138",
            caronasUtilizadas: 18,
            caronasRealizadas: 65,
            ranking: 4.9,
          ),
          rideDestinyDatetime: '2022-09-25 13:50:00',
          destinyPlace: "Rua Amad Massud "
              "rideSourceDatetime: '2022-07-22 08:30:00',- Jardim Apurá",
          sourcePlace: "POLI USP",
          price: 10.40,
          totalOccupation: 2,
          currentOccupation: 1,
          consumersUsers: [],
          locations: [],
      )
      Ride(
          driverUsers: User(
            imagePath:
            "https://images.unsplash.com/photo-1463453091185-61582044d556?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
            name: "Luiz Pereira",
            email: "luiz.pereira@usp.br",
            cpf: "307.674.600-65",
            telefone: "(11) 86737-7225",
            instituto: "IME",
            veiculoModelo: "Hilux",
            veiculoCor: "Cinza",
            veiculoMarca: "Toyota",
            veiculoPlaca: "GAE-4856",
            caronasUtilizadas: 87,
            caronasRealizadas: 89,
            ranking: 4.8,
          ),
          rideDestinyDatetime: '2022-09-24 15:10:00',
          destinyPlace: "IME USP",
          rideSourceDatetime: '2022-07-22 08:30:00',
          sourcePlace: "Rua Paiquerê - Vila Bandeirantes",
          price: 5.00,
          totalOccupation: 4,
          currentOccupation: 4,
        consumersUsers: [],
        locations: [],),
      Ride(
          driverUsers: User(
            imagePath:
            "https://images.unsplash.com/photo-1570045006801-08ec03621a42?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
            name: "Pedro Lima",
            email: "pedro.lima@usp.br",
            cpf: "841.183.650-90",
            telefone: "(11) 63335-0491",
            instituto: "IQ",
            veiculoModelo: "Astra",
            veiculoCor: "Vermelho",
            veiculoMarca: "Chevrolet",
            veiculoPlaca: "JCR-8773",
            caronasUtilizadas: 123,
            caronasRealizadas: 0,
            ranking: 2.1,
          ),
          rideDestinyDatetime: '2022-09-26 09:30:00',
          destinyPlace: "Rua William Speers "
              "rideSourceDatetime: '2022-07-22 08:30:00',- Lapa de Baixo",
          sourcePlace: "IQ USP",
          price: 6.00,
          totalOccupation: 4,
          currentOccupation: 0,
        consumersUsers: [],
        locations: [],),
      Ride(
          driverUsers: User(
            imagePath:
            "https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
            name: "Matheus Lima",
            email: "matheus.lima@usp.br",
            cpf: "580.779.140-12",
            telefone: "(11) 70386-7534",
            instituto: "IP",
            veiculoModelo: "COOPER S BAYSWATER",
            veiculoCor: "Azul",
            veiculoMarca: "MINI",
            veiculoPlaca: "JZA-0477",
            caronasUtilizadas: 20,
            caronasRealizadas: 49,
            ranking: 3.9,
          ),
          rideDestinyDatetime: '2022-09-25 07:20:00',
          destinyPlace: "IP USP",
          rideSourceDatetime: '2022-07-22 08:30:00',
          sourcePlace: "Rua Martim Carrasco - Pinheiros",
          price: 4.00,
          totalOccupation: 3,
          currentOccupation: 2,
        consumersUsers: [],
        locations: [],),
    ];
    return rideDates(offeredRides);
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

  Future<bool?> cancelRide(rideId) async {
    await Future.delayed(const Duration(seconds: 1));

    return true;
  }
}
