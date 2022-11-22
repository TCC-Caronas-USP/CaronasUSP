// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ride.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ride _$RideFromJson(Map<String, dynamic> json) => Ride(
      id: json['id'] as int,
      driver: Rider.fromJson(json['driver'] as Map<String, dynamic>),
      endTime: DateTime.parse(json['end_time'] as String),
      endingPoint:
          Location.fromJson(json['ending_point'] as Map<String, dynamic>),
      startTime: DateTime.parse(json['start_time'] as String),
      startingPoint:
          Location.fromJson(json['starting_point'] as Map<String, dynamic>),
      price: Ride.stringToDouble(json['price'] as String),
      maxPassengers: json['max_passengers'] as int,
      riders: (json['riders'] as List<dynamic>?)
          ?.map((e) => Rider.fromJson(e as Map<String, dynamic>))
          .toList(),
      passengerCount: json['passenger_count'] as int?,
    );

Map<String, dynamic> _$RideToJson(Ride instance) => <String, dynamic>{
      'id': instance.id,
      'driver': instance.driver,
      'end_time': instance.endTime.toIso8601String(),
      'ending_point': instance.endingPoint,
      'start_time': instance.startTime.toIso8601String(),
      'starting_point': instance.startingPoint,
      'price': instance.price,
      'passenger_count': instance.passengerCount,
      'max_passengers': instance.maxPassengers,
      'riders': instance.riders,
    };
