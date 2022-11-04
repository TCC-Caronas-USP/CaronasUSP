import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:caronas_usp/app/repositories/network/base_requester.dart';
import 'package:caronas_usp/model/rider.dart';

class RiderRequester extends BaseRequester {
  static Future<Rider> getRider() async {
    const path = '/rider/';
    final response = await BaseRequester.get(path);

    if (response.statusCode == HttpStatus.ok) {
      final Map<String, dynamic> userJson = json.decode(response.body);
      return Rider.fromJson(userJson);
    } else {
      var msg =
          'Unexpected ${response.statusCode} status code: ${response.reasonPhrase}, ${response.body}';
      throw HttpException(msg);
    }
  }

  static Future<Rider> postRider(Map<String, dynamic> params) async {
    const path = '/rider/';
    final response = await BaseRequester.post(path, params: params);

    if (response.statusCode == HttpStatus.created) {
      final Map<String, dynamic> userJson = json.decode(response.body);
      return Rider.fromJson(userJson);
    } else {
      var msg =
          'Unexpected ${response.statusCode} status code: ${response.reasonPhrase}, ${response.body}';
      throw HttpException(msg);
    }
  }
}
