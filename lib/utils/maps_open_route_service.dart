import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper{
  final String url ='https://api.openrouteservice.org/v2/directions/';
  final String apiKey = '5b3ce3597851110001cf62483bb4ca5ac2f04e23bf6f546f95234a47'; //TODO take this off here
  final String journeyMode = 'driving-car'; // Change it if you want or make it variable
  final List<List<double>> coordinates;

  NetworkHelper({required this.coordinates});

  Future getPolylinesData() async{
    http.Response response = await http.post(
        Uri.parse('$url$journeyMode/geojson'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': apiKey
        },
        body: jsonEncode(<String, List>{
          'coordinates': coordinates,
        }),
    );

    if(response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);

    }
    else{
      print("STATUS DA RESPOSTA");
      print(response.statusCode);
    }
  }
}