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
}
