import 'dart:async';

import 'package:caronas_usp/model/user.dart';

class UserRepository {
  Future<User> getUser(String email) async {
    // return UserGraphQLRequester.getUser(email); TODO implementar requester
    await Future.delayed(
        Duration(seconds: 1)); // TODO remover sleep e user mock

    return const User(
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
  }
}
