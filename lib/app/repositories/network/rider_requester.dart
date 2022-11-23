import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:caronas_usp/app/repositories/network/base_requester.dart';
import 'package:caronas_usp/app/models/rider.dart';

class RiderRequester extends BaseRequester {
  static Future<Rider> getRider() async {
    const path = '/riders';
    final response = await BaseRequester.get(path);

    if (response.statusCode == HttpStatus.ok) {
      var responseDecoded = const Utf8Decoder().convert(response.body.codeUnits);
      final Map<String, dynamic> userJson = json.decode(responseDecoded);
      return Rider.fromJson(userJson);
    } else {
      var msg =
          'Unexpected ${response.statusCode} status code: ${response.reasonPhrase}, ${response.body}';
      throw HttpException(msg);
    }
  }

  static Future<Rider> postRider(Map<String, dynamic> params) async {
    const path = '/riders';
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

  static Future<bool> patchRider(Map<String, dynamic> params) async {
    const path = '/riders';
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
