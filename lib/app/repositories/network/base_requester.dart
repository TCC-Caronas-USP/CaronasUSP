import 'dart:async';
import 'dart:collection';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:caronas_usp/app/core/constants.dart' as constants;

class BaseRequester {
  static Future<http.Response> get(String path, {HashMap<String, String>? headers}) async {
    final uri = Uri(scheme: 'http', host: constants.SERVER_HOST, port: constants.SERVER_PORT, path: path,);

    IdTokenResult? tokenResult = await FirebaseAuth.instance.currentUser?.getIdTokenResult();

    headers = (headers ?? HashMap<String, String>());
    headers["Authorization"] = "Bearer ${tokenResult?.token}";

    final response = await http.get(uri, headers: headers);

    return response;
  }
}
