import 'package:caronas_usp/model/rider.dart';

class UserPreferences {

  static const myUser = Rider(
      imagePath: "https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80",
      name: "João Souza",
      email: "joao.souza@usp.br",
      telefone: "(99) 99999-9999",
      instituto: "FAU - Arquitetura",
      curso: "",
      ano: 2022,
      caronasPassageiro: 10,
      caronasMotorista: 0,
      ranking: 4.9,
      vehicles: []
  );
}
