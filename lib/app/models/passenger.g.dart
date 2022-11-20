// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'passenger.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Passenger _$PassengerFromJson(Map<String, dynamic> json) => Passenger(
      id: json['id'] as int,
      rideId: json['ride_id'] as int,
      riderId: json['rider_id'] as int,
      riderName: json['rider_name'] as String,
      riderInstituto: json['rider_instituto'] as String,
      riderImagePath: json['rider_image_path'] as String,
      meetingPoint:
          Location.fromJson(json['meeting_point'] as Map<String, dynamic>),
      status: $enumDecode(_$RidePassengerStatusEnumMap, json['status']), riderTelefone: '',
    );

Map<String, dynamic> _$PassengerToJson(Passenger instance) => <String, dynamic>{
      'id': instance.id,
      'ride_id': instance.rideId,
      'rider_id': instance.riderId,
      'rider_name': instance.riderName,
      'rider_instituto': instance.riderInstituto,
      'rider_image_path': instance.riderImagePath,
      'meeting_point': instance.meetingPoint,
      'status': _$RidePassengerStatusEnumMap[instance.status]!,
    };

const _$RidePassengerStatusEnumMap = {
  RidePassengerStatus.approved: 'approved',
  RidePassengerStatus.waiting: 'waiting',
  RidePassengerStatus.rejected: 'rejected',
};
