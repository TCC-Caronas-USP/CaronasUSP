import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:caronas_usp/app/repositories/network/base_requester.dart';
import 'package:caronas_usp/app/models/ride.dart';

class RideRequester extends BaseRequester {
  static Future<List<Ride>> getRides() async {
    const path = '/rides';
    final response = await BaseRequester.get(path);

    if (response.statusCode == HttpStatus.ok) {
      var responseDecoded = const Utf8Decoder().convert(response.body.codeUnits);
      final List<dynamic> ridesListJson = json.decode(responseDecoded);
      return ridesListJson.map((data) => Ride.fromJson(data)).toList();
    } else {
      var msg =
          'Unexpected ${response.statusCode} status code: ${response.reasonPhrase}, ${response.body}';
      throw HttpException(msg);
    }
  }

  static Future<Ride> getRide(int rideId) async {
    String path = '/rides/$rideId';
    final response = await BaseRequester.get(path);

    if (response.statusCode == HttpStatus.ok) {
      var responseDecoded = const Utf8Decoder().convert(response.body.codeUnits);
      return Ride.fromJson(json.decode(responseDecoded));
    } else {
      var msg =
          'Unexpected ${response.statusCode} status code: ${response.reasonPhrase}, ${response.body}';
      throw HttpException(msg);
    }
  }

  static Future<List<Ride>> getRidesAsDriver() async {
    const path = '/rides/driver';
    final response = await BaseRequester.get(path);

    if (response.statusCode == HttpStatus.ok) {
      var responseDecoded = const Utf8Decoder().convert(response.body.codeUnits);
      final List<dynamic> ridesListJson = json.decode(responseDecoded);
      return ridesListJson.map((data) => Ride.fromJson(data)).toList();
    } else {
      var msg =
          'Unexpected ${response.statusCode} status code: ${response.reasonPhrase}, ${response.body}';
      throw HttpException(msg);
    }
  }

  static Future<List<Ride>> getRidesAsPassenger() async {
    const path = '/rides/passenger';
    final response = await BaseRequester.get(path);

    if (response.statusCode == HttpStatus.ok) {
      var responseDecoded = const Utf8Decoder().convert(response.body.codeUnits);
      final List<dynamic> ridesListJson = json.decode(responseDecoded);
      return ridesListJson.map((data) => Ride.fromJson(data)).toList();
    } else {
      var msg =
          'Unexpected ${response.statusCode} status code: ${response.reasonPhrase}, ${response.body}';
      throw HttpException(msg);
    }
  }

  static Future<bool> postRide(Map<String, dynamic> params) async {
    const path = '/rides';
    final response = await BaseRequester.post(path, params: params);

    if (response.statusCode == HttpStatus.created) {
      return true;
    } else {
      var msg =
          'Unexpected ${response.statusCode} status code: ${response.reasonPhrase}, ${response.body}';
      throw HttpException(msg);
    }
  }

  static Future<bool> deleteRide(int rideId) async {
    String path = '/rides/$rideId';
    final response = await BaseRequester.delete(path);

    if (response.statusCode == HttpStatus.noContent) {
      return true;
    } else {
      var msg =
          'Unexpected ${response.statusCode} status code: ${response.reasonPhrase}, ${response.body}';
      throw HttpException(msg);
    }
  }
}
