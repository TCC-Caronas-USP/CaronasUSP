// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Vehicle _$VehicleFromJson(Map<String, dynamic> json) => Vehicle(
      model: json['model'] as String,
      color: json['color'] as String,
      brand: json['brand'] as String,
      licensePlate: json['license_plate'] as String,
    );

Map<String, dynamic> _$VehicleToJson(Vehicle instance) => <String, dynamic>{
      'model': instance.model,
      'color': instance.color,
      'brand': instance.brand,
      'license_plate': instance.licensePlate,
    };
