import 'package:caronas_usp/utils/maps_open_route_service.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsDirections extends NetworkHelper {
  final List<LatLng> polyPoints = []; // For holding Co-ordinates as LatLng
  final Set<Polyline> polyLines = {}; // For holding instance of Polyline

  MapsDirections({required coordinates}) : super(coordinates: coordinates);

  Future<Set<Polyline>> getDirectionsJsonData() async {
    // Create an instance of Class NetworkHelper which uses http package
    // for requesting data to the server and receiving response as JSON format

    try {
      // getData() returns a json Decoded data
      var data = await getPolylinesData();

      // We can reach to our desired JSON data manually as following
      LineString ls = LineString(data['features'][0]['geometry']['coordinates']);
      // LineString(data['features'][0]['properties']['summary'])

      for (int i = 0; i < ls.lineString.length; i++) {
        polyPoints.add(LatLng(ls.lineString[i][1], ls.lineString[i][0]));
      }

      if (polyPoints.length == ls.lineString.length) {
        Polyline polyline = Polyline(
          polylineId: const PolylineId("polyline"),
          color: Colors.green,
          width: 5,
          points: polyPoints,
        );
        polyLines.add(polyline);
      }
    } catch (e) {
      print(e);
    }

    return polyLines;
  }
}

//Create a new class to hold the Co-ordinates we've received from the response data
class LineString {
  LineString(this.lineString);
  List<dynamic> lineString;
}