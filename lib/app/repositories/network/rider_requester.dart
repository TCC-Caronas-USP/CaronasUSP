import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:caronas_usp/app/core/constants.dart' as constants;
import 'package:caronas_usp/app/repositories/network/base_requester.dart';
import 'package:caronas_usp/model/rider.dart';

class RiderRequester extends BaseRequester {
  static Future<Rider> getRider() async {
    final uri = Uri.https(constants.DOMAIN, '/rider', {});

    final response = await BaseRequester.get(uri);

    if (response.statusCode == HttpStatus.ok) {
      final Map<String, dynamic> userJson = json.decode(response.body);
      return Rider.fromJson(userJson);
    } else {
      var msg =
          'Unexpected ${response.statusCode} status code: ${response.reasonPhrase}, ${response.body}';
      throw HttpException(msg, uri: uri);
    }
  }
}
