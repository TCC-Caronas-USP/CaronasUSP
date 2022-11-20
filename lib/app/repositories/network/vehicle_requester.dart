import 'dart:async';
import 'dart:io';

import 'package:caronas_usp/app/repositories/network/base_requester.dart';

class VehicleRequester extends BaseRequester {
  static Future<bool> postVehicle(Map<String, dynamic> params) async {
    const path = '/vehicle/';
    final response = await BaseRequester.post(path, params: params);

    if (response.statusCode == HttpStatus.created) {
      return true;
    } else {
      var msg =
          'Unexpected ${response.statusCode} status code: ${response.reasonPhrase}, ${response.body}';
      throw HttpException(msg);
    }
  }

  static Future<bool> patchVehicle(Map<String, dynamic> params) async {
    const path = '/vehicle/';
    final response = await BaseRequester.patch(path, params: params);

    if (response.statusCode == HttpStatus.ok) {
      return true;
    } else {
      var msg =
          'Unexpected ${response.statusCode} status code: ${response.reasonPhrase}, ${response.body}';
      throw HttpException(msg);
    }
  }
}
