// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ride.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ride _$RideFromJson(Map<String, dynamic> json) => Ride(
      id: json['id'] as int,
      driver: Rider.fromJson(json['driver'] as Map<String, dynamic>),
      arrivalTime: DateTime.parse(json['arrival_time'] as String),
      destination:
          Location.fromJson(json['destination'] as Map<String, dynamic>),
      departureTime: DateTime.parse(json['departure_time'] as String),
      origin: Location.fromJson(json['origin'] as Map<String, dynamic>),
      price: (json['price'] as num).toDouble(),
      maxNumPassengers: json['max_num_passengers'] as int,
      passengers: (json['passengers'] as List<dynamic>)
          .map((e) => Passenger.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RideToJson(Ride instance) => <String, dynamic>{
      'id': instance.id,
      'driver': instance.driver,
      'arrival_time': instance.arrivalTime.toIso8601String(),
      'destination': instance.destination,
      'departure_time': instance.departureTime.toIso8601String(),
      'origin': instance.origin,
      'price': instance.price,
      'max_num_passengers': instance.maxNumPassengers,
      'passengers': instance.passengers,
    };
