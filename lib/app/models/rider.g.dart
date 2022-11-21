// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rider.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Rider _$RiderFromJson(Map<String, dynamic> json) => Rider(
      id: json['id'] as int?,
      profileImage: json['profile_image'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      phoneNumber: json['phone_number'] as String,
      college: json['college'] as String,
      course: json['course'] as String,
      ingressYear: json['ingress_year'] as int,
      caronasMotorista: json['rides_as_driver'] as int?,
      caronasPassageiro: json['rides_as_passenger'] as int?,
      vehicles: (json['vehicles'] as List<dynamic>)
          .map((e) => Vehicle.fromJson(e as Map<String, dynamic>))
          .toList(),
      passenger: json['passenger'] == null
          ? null
          : Passenger.fromJson(json['passenger'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RiderToJson(Rider instance) => <String, dynamic>{
      'id': instance.id,
      'profile_image': instance.profileImage,
      'name': instance.name,
      'email': instance.email,
      'phone_number': instance.phoneNumber,
      'college': instance.college,
      'course': instance.course,
      'ingress_year': instance.ingressYear,
      'rides_as_driver': instance.caronasMotorista,
      'rides_as_passenger': instance.caronasPassageiro,
      'vehicles': instance.vehicles,
      'passenger': instance.passenger,
    };
