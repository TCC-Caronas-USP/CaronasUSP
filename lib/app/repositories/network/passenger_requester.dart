import 'dart:async';
import 'dart:io';
import 'package:caronas_usp/app/models/passenger.dart';

import 'package:caronas_usp/app/repositories/network/base_requester.dart';

class PassengerRequester extends BaseRequester {
  static Future<bool> post(Map<String, dynamic> params) async {
    String path = '/passengers';
    final response = await BaseRequester.post(path, params: params);

    if (response.statusCode == HttpStatus.created) {
      return true;
    } else {
      var msg =
          'Unexpected ${response.statusCode} status code: ${response.reasonPhrase}, ${response.body}';
      throw HttpException(msg);
    }
  }

  static Future<bool> accept(Passenger passenger) async {
    int passengerId = passenger.id;
    String path = '/passengers/$passengerId/accept';
    final response = await BaseRequester.patch(path);

    if (response.statusCode == HttpStatus.ok) {
      return true;
    } else {
      var msg =
          'Unexpected ${response.statusCode} status code: ${response.reasonPhrase}, ${response.body}';
      throw HttpException(msg);
    }
  }

  static Future<bool> reject(Passenger passenger) async {
    int passengerId = passenger.id;
    String path = '/passengers/$passengerId/reject';
    final response = await BaseRequester.patch(path);

    if (response.statusCode == HttpStatus.ok) {
      return true;
    } else {
      var msg =
          'Unexpected ${response.statusCode} status code: ${response.reasonPhrase}, ${response.body}';
      throw HttpException(msg);
    }
  }

  static Future<bool> deletePassenger(Passenger passenger) async {
    int passengerId = passenger.id;
    String path = '/passengers/$passengerId';
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
