// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rider.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Rider _$RiderFromJson(Map<String, dynamic> json) => Rider(
      imagePath: json['image_path'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      telefone: json['telefone'] as String,
      instituto: json['instituto'] as String,
      curso: json['curso'] as String,
      ano: json['ano'] as int,
      caronasMotorista: json['rides_as_driver'] as int,
      caronasPassageiro: json['rides_as_passenger'] as int,
      ranking: (json['ranking'] as num).toDouble(),
      vehicles: (json['vehicles'] as List<dynamic>)
          .map((e) => Vehicle.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RiderToJson(Rider instance) => <String, dynamic>{
      'image_path': instance.imagePath,
      'name': instance.name,
      'email': instance.email,
      'telefone': instance.telefone,
      'instituto': instance.instituto,
      'curso': instance.curso,
      'ano': instance.ano,
      'rides_as_driver': instance.caronasMotorista,
      'rides_as_passenger': instance.caronasPassageiro,
      'ranking': instance.ranking,
      'vehicles': instance.vehicles,
    };
