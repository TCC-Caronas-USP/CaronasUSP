import 'dart:async';
import 'dart:collection';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

class BaseRequester {
  static Future<http.Response> get(Uri uri, {HashMap<String, String>? headers}) async {

    IdTokenResult? tokenResult = await FirebaseAuth.instance.currentUser?.getIdTokenResult();

    headers = (headers ?? HashMap<String, String>());
    headers["Authorization"] = "Bearer ${tokenResult?.token}";

    final response = await http.get(uri, headers: headers);

    return response;
  }
}
