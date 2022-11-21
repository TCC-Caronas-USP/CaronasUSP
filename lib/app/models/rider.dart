import 'package:caronas_usp/app/models/passenger.dart';
import 'package:caronas_usp/app/models/vehicle.dart';
import 'package:json_annotation/json_annotation.dart';

part 'rider.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Rider {
  int id;
  final String profileImage;
  final String name;
  final String email;
  final String phoneNumber;
  final String college;
  final String course;
  final int ingressYear;
  @JsonKey(name: 'rides_as_driver')
  final int? caronasMotorista;
  @JsonKey(name: 'rides_as_passenger')
  final int? caronasPassageiro;
  final List<Vehicle> vehicles;
  final Passenger? passenger;

  factory Rider.fromJson(Map<String, dynamic> json) => _$RiderFromJson(json);

  Map<String, dynamic> toJson() => _$RiderToJson(this);

  Rider({
    required this.id,
    required this.profileImage,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.college,
    required this.course,
    required this.ingressYear,
    this.caronasMotorista,
    this.caronasPassageiro,
    required this.vehicles,
    this.passenger
  });
}