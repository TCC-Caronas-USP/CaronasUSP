import 'dart:async';
import 'package:caronas_usp/model/location.dart';
import 'package:caronas_usp/model/ride.dart';
import 'package:caronas_usp/model/rider.dart';
import 'package:caronas_usp/model/vehicle.dart';

class RidesRepository {
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
        if (userOfferedRideDate == ride.rideDestinyDatetime.substring(0, 10)) {
          rideOfTheSameDay.add(ride);
        }
      }
      ridesOfTheSameDay.add(rideOfTheSameDay);
    }
    return ridesOfTheSameDay;
  }

  static const driverUser = Rider(
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

  static const consumerUser1 = Rider(
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

  static const consumerUser2 = Rider(
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

  static const myOfferedRides = <Ride>[
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

  static const offeredRides = <Ride>[
    Ride(
      driverUsers: Rider(
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
          vehicles: []),
      rideDestinyDatetime: '2022-09-24 17:35:00',
      destinyPlace: "FAU USP",
      rideSourceDatetime: '2022-07-22 08:30:00',
      sourcePlace: "Rua Nova Hamburgo - Ipiranga",
      price: 4.50,
      totalOccupation: 4,
      currentOccupation: 2,
      consumersUsers: [],
      locations: [
        Location(
            id: "1011110",
            description: "Rua Nova Hamburgo - Ipiranga",
            lat: -23.600949193214976,
            lon: -46.59260493159567),
        Location(
            id: "1011011",
            description: "FAU USP",
            lat: -23.559905784167515,
            lon: -46.72986378742103)
      ],
      rideId: '0000-0010',
    ),
    Ride(
      driverUsers: Rider(
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
          vehicles: []),
      rideDestinyDatetime: '2022-09-25 13:50:00',
      destinyPlace: "Rua Amad Massud - Jardim Apurá",
      rideSourceDatetime: "2022-07-22 08:30:00",
      sourcePlace: "POLI USP",
      price: 10.40,
      totalOccupation: 2,
      currentOccupation: 1,
      consumersUsers: [],
      locations: [
        Location(
            id: "1011010",
            description: "Rua Paiquerê - Vila Bandeirantes",
            lat: -23.49762904491432,
            lon: -46.66445241625738),
        Location(
            id: "1011011",
            description: "POLI USP",
            lat: -23.556977524989904,
            lon: -46.73021254499231)
      ],
      rideId: '0000-0011',
    ),
    Ride(
      driverUsers: Rider(
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
          vehicles: []),
      rideDestinyDatetime: '2022-09-24 15:10:00',
      destinyPlace: "IME USP",
      rideSourceDatetime: '2022-07-22 08:30:00',
      sourcePlace: "Rua Paiquerê - Vila Bandeirantes",
      price: 5.00,
      totalOccupation: 4,
      currentOccupation: 4,
      consumersUsers: [],
      locations: [
        Location(
            id: "1011000",
            description: "Rua Paiquerê - Vila Bandeirantes",
            lat: -23.49762904491432,
            lon: -46.66445241625738),
        Location(
            id: "1011001",
            description: "IME USP",
            lat: -23.559470293931206,
            lon: -46.73197834509127)
      ],
      rideId: '0000-0012',
    ),
    Ride(
      driverUsers: Rider(
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
          vehicles: []),
      rideDestinyDatetime: '2022-09-26 09:30:00',
      destinyPlace: "Rua William Speers - Lapa de Baixo",
      rideSourceDatetime: '2022-07-22 08:30:00',
      sourcePlace: "IQ USP",
      price: 6.00,
      totalOccupation: 4,
      currentOccupation: 0,
      consumersUsers: [],
      locations: [
        Location(
            id: "10101100",
            description: "IQ USP",
            lat: -23.564336467051916,
            lon: -46.72606578926664),
        Location(
            id: "10101101",
            description: "Rua William Speers - Lapa de Baixo",
            lat: -23.517578193636982,
            lon: -46.703022802762305),
      ],
      rideId: '0000-0013',
    ),
    Ride(
      driverUsers: Rider(
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
          vehicles: []),
      rideDestinyDatetime: '2022-09-25 07:20:00',
      destinyPlace: "IP USP",
      rideSourceDatetime: '2022-07-22 08:30:00',
      sourcePlace: "Rua Martim Carrasco - Pinheiros",
      price: 4.00,
      totalOccupation: 3,
      currentOccupation: 2,
      consumersUsers: [],
      locations: [
        Location(
            id: "10101010",
            description: "Rua Martim Carrasco - Pinheiros",
            lat: -23.566261147367598,
            lon: -46.694431920242124),
        Location(
            id: "10101011",
            description: "IP USP",
            lat: -23.555278848304788,
            lon: -46.724689958586225),
      ],
      rideId: '0000-0014',
    ),
  ];

  static const myRides = <Ride>[
    Ride(
        driverUsers: Rider(
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
            vehicles: [
              Vehicle(
                  model: 'Ka', color: 'Prata', brand: 'Ford', licensePlate: 'ABC1D34')
            ]),
        rideDestinyDatetime: '2022-09-24 17:35:00',
        destinyPlace: "FAU USP",
        rideSourceDatetime: '2022-07-22 08:30:00',
        sourcePlace: "Rua Nova Hamburgo - Ipiranga",
        price: 4.50,
        totalOccupation: 4,
        currentOccupation: 2,
        consumersUsers: [],
        locations: [
          Location(
              id: "1011110",
              description: "Rua Nova Hamburgo - Ipiranga",
              lat: -23.600949193214976,
              lon: -46.59260493159567),
          Location(
              id: "1011011",
              description: "FAU USP",
              lat: -23.559905784167515,
              lon: -46.72986378742103)
        ],
        rideId: '0000-0010',
        myRideStatus: "approved"),
    Ride(
        driverUsers: Rider(
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
            vehicles: [
              Vehicle(
                  model: 'Ka', color: 'Prata', brand: 'Ford', licensePlate: 'ABC1D34')
            ]),
        rideDestinyDatetime: '2022-09-24 15:10:00',
        destinyPlace: "IME USP",
        rideSourceDatetime: '2022-07-22 08:30:00',
        sourcePlace: "Rua Paiquerê - Vila Bandeirantes",
        price: 5.00,
        totalOccupation: 4,
        currentOccupation: 4,
        consumersUsers: [],
        locations: [
          Location(
              id: "1011000",
              description: "Rua Paiquerê - Vila Bandeirantes",
              lat: -23.49762904491432,
              lon: -46.66445241625738),
          Location(
              id: "1011001",
              description: "IME USP",
              lat: -23.559470293931206,
              lon: -46.73197834509127)
        ],
        rideId: '0000-0012',
        myRideStatus: "waiting"),
    Ride(
        driverUsers: Rider(
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
            vehicles: [
              Vehicle(
                  model: 'Ka', color: 'Prata', brand: 'Ford', licensePlate: 'ABC1D34')
            ]),
        rideDestinyDatetime: '2022-09-25 13:50:00',
        destinyPlace: "Rua Amad Massud - Jardim Apurá",
        rideSourceDatetime: "2022-07-22 08:30:00",
        sourcePlace: "POLI USP",
        price: 10.40,
        totalOccupation: 2,
        currentOccupation: 1,
        consumersUsers: [],
        locations: [
          Location(
              id: "1011010",
              description: "Rua Paiquerê - Vila Bandeirantes",
              lat: -23.49762904491432,
              lon: -46.66445241625738),
          Location(
              id: "1011011",
              description: "POLI USP",
              lat: -23.556977524989904,
              lon: -46.73021254499231)
        ],
        rideId: '0000-0011',
        myRideStatus: "rejected"),
  ];

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

  Future<Ride?> getRide(rideId) async {
    await Future.delayed(const Duration(seconds: 1));
    Ride? ride;
    ride = (myOfferedRides + offeredRides)
        .firstWhere((element) => element.rideId == rideId);
    return ride;
  }

  Future<bool?> cancelRide(rideId) async {
    await Future.delayed(const Duration(seconds: 1));

    return true;
  }

  Future<List<List<Ride>>> getMyRides() async {
    // return UserGraphQLRequester.getMyRides(); TODO implementar requester
    await Future.delayed(const Duration(seconds: 1));

    return rideDates(myRides);
  }
}
