import 'dart:async';
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
          rideDate: '2022-09-24 17:35:00',
          destinyPlace: "FAU USP",
          sourcePlace: "Rua Nova Hamburgo - Ipiranga",
          price: 4.50,
          totalOccupation: 4,
          currentOccupation: 2),
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
          rideDate: '2022-09-25 13:50:00',
          destinyPlace: "Rua Amad Massud - Jardim Apurá",
          sourcePlace: "POLI USP",
          price: 10.40,
          totalOccupation: 2,
          currentOccupation: 1),
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
          rideDate: '2022-09-24 15:10:00',
          destinyPlace: "IME USP",
          sourcePlace: "Rua Paiquerê - Vila Bandeirantes",
          price: 5.00,
          totalOccupation: 4,
          currentOccupation: 4),
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
          rideDate: '2022-09-26 09:30:00',
          destinyPlace: "Rua William Speers - Lapa de Baixo",
          sourcePlace: "IQ USP",
          price: 6.00,
          totalOccupation: 4,
          currentOccupation: 0),
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
          rideDate: '2022-09-25 07:20:00',
          destinyPlace: "IP USP",
          sourcePlace: "Rua Martim Carrasco - Pinheiros",
          price: 4.00,
          totalOccupation: 3,
          currentOccupation: 2),
      Ride(
          driverUsers: User(
            imagePath:
                "https://images.unsplash.com/photo-1626565244872-206f4c1f9e57?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
            name: "Márcio Lopes",
            email: "marcio.lopes@usp.br",
            cpf: "607.024.860-00",
            telefone: "(11) 95467-3921",
            instituto: "FEA",
            veiculoModelo: "AMAROK",
            veiculoCor: "Cinza",
            veiculoMarca: "VolksWagen",
            veiculoPlaca: "FYB-1593",
            caronasUtilizadas: 2,
            caronasRealizadas: 21,
            ranking: 4.1,
          ),
          rideDate: '2022-09-24 10:30:00',
          destinyPlace: "FEA USP",
          sourcePlace: "Travessa Humberto I - Vila Mariana",
          price: 6.00,
          totalOccupation: 3,
          currentOccupation: 1),
    ];
    return rideDates(offeredRides);
  }

  Future<List<List<Ride>>> getMyRides() async {
    // return UserGraphQLRequester.getMyRides(); TODO implementar requester
    await Future.delayed(const Duration(seconds: 1));

    const myRides = <Ride>[
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
          rideDate: '2022-09-24 17:35:00',
          destinyPlace: "FAU USP",
          sourcePlace: "Rua Nova Hamburgo - Ipiranga",
          price: 4.50,
          totalOccupation: 4,
          currentOccupation: 2,
          myRideStatus: "approved"),
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
          rideDate: '2022-09-24 15:10:00',
          destinyPlace: "IME USP",
          sourcePlace: "Rua Paiquerê - Vila Bandeirantes",
          price: 5.00,
          totalOccupation: 4,
          currentOccupation: 4,
          myRideStatus: "waiting"),
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
          rideDate: '2022-09-25 13:50:00',
          destinyPlace: "Rua Amad Massud - Jardim Apurá",
          sourcePlace: "POLI USP",
          price: 10.40,
          totalOccupation: 2,
          currentOccupation: 1,
          myRideStatus: "rejected"),
    ];
    return rideDates(myRides);
  }
}
