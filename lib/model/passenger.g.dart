// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'passenger.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Passenger _$PassengerFromJson(Map<String, dynamic> json) => Passenger(
      id: json['id'] as String,
      rideId: json['ride_id'] as String,
      riderId: json['rider_id'] as String,
      riderName: json['rider_name'] as String,
      meetingPoint:
          Location.fromJson(json['meeting_point'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PassengerToJson(Passenger instance) => <String, dynamic>{
      'id': instance.id,
      'ride_id': instance.rideId,
      'rider_id': instance.riderId,
      'rider_name': instance.riderName,
      'meeting_point': instance.meetingPoint,
    };
