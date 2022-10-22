import 'dart:async';

import 'package:caronas_usp/model/rider.dart';
import 'package:caronas_usp/model/vehicle.dart';

class RiderRepository {
  Future<Rider> getRider() async {
    // return RiderRequester.getRider();
    await Future.delayed(const Duration(seconds: 1));

    return const Rider(
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
  }

  Future<bool?> updateRiderInfo(Rider rider) async {
    // return RiderRequester.updateRiderInfo();
    await Future.delayed(const Duration(seconds: 1));

    print(rider.toString());
    print(rider.toJson());

    return true;
  }
}
