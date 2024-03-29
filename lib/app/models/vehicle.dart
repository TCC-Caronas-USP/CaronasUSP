import 'package:json_annotation/json_annotation.dart';

part 'vehicle.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Vehicle {
  int? id;
  final String model;
  final String color;
  final String brand;
  final String licensePlate;

  factory Vehicle.fromJson(Map<String, dynamic> json) => _$VehicleFromJson(json);

  Map<String, dynamic> toJson() => _$VehicleToJson(this);

  Vehicle({
    this.id,
    required this.model,
    required this.color,
    required this.brand,
    required this.licensePlate,
  });
}