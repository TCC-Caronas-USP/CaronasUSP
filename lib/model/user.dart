import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class User {
  final String imagePath;
  final String name;
  final String email;
  final String cpf;
  final String telefone;
  final String instituto;
  final String veiculoModelo;
  final String veiculoCor;
  final String veiculoMarca;
  final String veiculoPlaca;
  final int caronasUtilizadas;
  final int caronasRealizadas;
  final double ranking;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  const User({
    required this.imagePath,
    required this.name,
    required this.email,
    required this.cpf,
    required this.telefone,
    required this.instituto,
    required this.veiculoModelo,
    required this.veiculoCor,
    required this.veiculoMarca,
    required this.veiculoPlaca,
    required this.caronasUtilizadas,
    required this.caronasRealizadas,
    required this.ranking,
  });
}