import 'dart:async';
import 'dart:io';
import 'package:caronas_usp/app/models/passenger.dart';

import 'package:caronas_usp/app/repositories/network/base_requester.dart';

class PassengerRequester extends BaseRequester {
  static Future<bool> accept(Passenger passenger) async {
    int passengerId = passenger.id;
    String path = '/passenger/$passengerId/accept';
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
    String path = '/passenger/$passengerId/reject';
    final response = await BaseRequester.patch(path);

    if (response.statusCode == HttpStatus.ok) {
      return true;
    } else {
      var msg =
          'Unexpected ${response.statusCode} status code: ${response.reasonPhrase}, ${response.body}';
      throw HttpException(msg);
    }
  }
}
