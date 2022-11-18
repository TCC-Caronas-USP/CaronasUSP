import 'package:caronas_usp/app/utils/maps_autocomplete.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  final String url = 'https://api.openrouteservice.org/';
  final String apiKey =
      '5b3ce3597851110001cf62483bb4ca5ac2f04e23bf6f546f95234a47'; //TODO take this off here
  final String journeyMode =
      'driving-car'; // Change it if you want or make it variable
  final List<List<double>> coordinates;

  NetworkHelper({required this.coordinates});

  Future getPolylinesData() async {
    http.Response response = await http.post(
      Uri.parse('${url}v2/directions/$journeyMode/geojson'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': apiKey
      },
      body: jsonEncode(<String, List>{
        'coordinates': coordinates,
      }),
    );

    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print("STATUS DA RESPOSTA");
      print(response.statusCode);
    }
  }

  Future getAutocomplete(String text) async {

    final queryParameters = {
      "api_key": apiKey,
      "text": text,
      "boundary.country": "BR",
      "focus.point.lon": "-46.720851282140345",
      "focus.point.lat": "-23.56241043135007",
      "sources": "osm"
    };

    http.Response response = await http.get(
      Uri.https(
          'api.openrouteservice.org',
          '/geocode/autocomplete',
          queryParameters
      ),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      String data = response.body;
      return openSourceAutoCompleteFromJson(data);
    } else {
      print("STATUS DA RESPOSTA: ${response.statusCode}");
    }
  }
}
