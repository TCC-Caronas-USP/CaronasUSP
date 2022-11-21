// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'passenger.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Passenger _$PassengerFromJson(Map<String, dynamic> json) => Passenger(
      id: json['id'] as int,
      rideId: json['ride'] as int,
      riderId: json['rider'] as int,
      meetingPoint:
          Location.fromJson(json['meeting_point'] as Map<String, dynamic>),
      status: $enumDecode(_$RidePassengerStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$PassengerToJson(Passenger instance) => <String, dynamic>{
      'id': instance.id,
      'ride': instance.rideId,
      'rider': instance.riderId,
      'meeting_point': instance.meetingPoint,
      'status': _$RidePassengerStatusEnumMap[instance.status]!,
    };

const _$RidePassengerStatusEnumMap = {
  RidePassengerStatus.rejected: 0,
  RidePassengerStatus.waiting: 1,
  RidePassengerStatus.approved: 2,
};
