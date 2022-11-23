import 'dart:async';
import 'dart:collection';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:caronas_usp/app/core/constants.dart' as constants;
import 'dart:convert';

class BaseRequester {
  static Uri getUri(String path) {
    return Uri(
      scheme: constants.URI_SCHEME,
      host: constants.SERVER_HOST,
      path: path,
    );
  }

  static Future<String> getBearerToken() async {
    IdTokenResult? tokenResult =
        await FirebaseAuth.instance.currentUser?.getIdTokenResult();
    String idToken = tokenResult?.token ?? "";
    return idToken;
  }

  static Future<Map<String, String>> getHeaders(
      Map<String, String>? headers) async {
    String bearerToken = await getBearerToken();

    headers = (headers ?? HashMap<String, String>());
    headers["Authorization"] = "Bearer $bearerToken";
    headers["Content-Type"] = "application/json; charset=utf-8";
    return headers;
  }

  static Future<http.Response> get(String path,
      {Map<String, String>? headers}) async {
    Uri uri = getUri(path);
    headers = await getHeaders(headers);
    final response = await http.get(uri, headers: headers);
    print(response.body);
    return response;
  }

  static Future<http.Response> post(String path,
      {Map<String, String>? headers, Map<String, dynamic>? params}) async {
    Uri uri = getUri(path);
    headers = await getHeaders(headers);
    final body = jsonEncode(params);
    final response = await http.post(uri, headers: headers, body: body);
    print(response.body);
    return response;
  }

  static Future<http.Response> patch(String path,
      {Map<String, String>? headers, Map<String, dynamic>? params}) async {
    Uri uri = getUri(path);
    headers = await getHeaders(headers);
    final body = jsonEncode(params);
    final response = await http.patch(uri, headers: headers, body: body);
    print(response.body);
    return response;
  }

  static Future<http.Response> delete(String path,
      {Map<String, String>? headers}) async {
    Uri uri = getUri(path);
    headers = await getHeaders(headers);
    final response = await http.delete(uri, headers: headers);
    print(response.body);
    return response;
  }
}
