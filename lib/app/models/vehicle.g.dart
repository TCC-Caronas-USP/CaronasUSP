// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Vehicle _$VehicleFromJson(Map<String, dynamic> json) => Vehicle(
      id: json['id'] as int?,
      model: json['model'] as String,
      color: json['color'] as String,
      brand: json['brand'] as String,
      licensePlate: json['license_plate'] as String,
    );

Map<String, dynamic> _$VehicleToJson(Vehicle instance) => <String, dynamic>{
      'id': instance.id,
      'model': instance.model,
      'color': instance.color,
      'brand': instance.brand,
      'license_plate': instance.licensePlate,
    };
