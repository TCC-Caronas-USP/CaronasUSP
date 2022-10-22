// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ride.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ride _$RideFromJson(Map<String, dynamic> json) => Ride(
      rideId: json['ride_id'] as String,
      driverUsers: Rider.fromJson(json['driver_users'] as Map<String, dynamic>),
      rideDestinyDatetime: json['ride_destiny_datetime'] as String,
      destinyPlace: json['destiny_place'] as String,
      rideSourceDatetime: json['ride_source_datetime'] as String,
      sourcePlace: json['source_place'] as String,
      price: (json['price'] as num).toDouble(),
      totalOccupation: json['total_occupation'] as int,
      currentOccupation: json['current_occupation'] as int,
      consumersUsers: (json['consumers_users'] as List<dynamic>)
          .map((e) => Rider.fromJson(e as Map<String, dynamic>))
          .toList(),
      locations: (json['locations'] as List<dynamic>)
          .map((e) => Location.fromJson(e as Map<String, dynamic>))
          .toList(),
      myRideStatus: json['my_ride_status'] as String?,
    );

Map<String, dynamic> _$RideToJson(Ride instance) => <String, dynamic>{
      'ride_id': instance.rideId,
      'driver_users': instance.driverUsers,
      'ride_destiny_datetime': instance.rideDestinyDatetime,
      'destiny_place': instance.destinyPlace,
      'ride_source_datetime': instance.rideSourceDatetime,
      'source_place': instance.sourcePlace,
      'price': instance.price,
      'total_occupation': instance.totalOccupation,
      'current_occupation': instance.currentOccupation,
      'consumers_users': instance.consumersUsers,
      'locations': instance.locations,
      'my_ride_status': instance.myRideStatus,
    };
