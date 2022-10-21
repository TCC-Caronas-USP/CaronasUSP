import 'package:caronas_usp/model/vehicle.dart';
import 'package:json_annotation/json_annotation.dart';

part 'rider.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Rider {
  final String imagePath;
  final String name;
  final String email;
  final String telefone;
  final String instituto;
  final String curso;
  final int ano;
  @JsonKey(name: 'rides_as_driver')
  final int caronasMotorista;
  @JsonKey(name: 'rides_as_passenger')
  final int caronasPassageiro;
  final double ranking;
  final List<Vehicle> vehicles;

  factory Rider.fromJson(Map<String, dynamic> json) => _$RiderFromJson(json);

  Map<String, dynamic> toJson() => _$RiderToJson(this);

  const Rider({
    required this.imagePath,
    required this.name,
    required this.email,
    required this.telefone,
    required this.instituto,
    required this.curso,
    required this.ano,
    required this.caronasMotorista,
    required this.caronasPassageiro,
    required this.ranking,
    required this.vehicles
  });
}