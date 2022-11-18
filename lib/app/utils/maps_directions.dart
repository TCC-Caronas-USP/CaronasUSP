import 'package:caronas_usp/app/utils/maps_open_route_service.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsDirections extends NetworkHelper {
  final List<LatLng> polyPoints = []; // For holding Co-ordinates as LatLng
  final Set<Polyline> polyLines = {}; // For holding instance of Polyline

  MapsDirections({required coordinates}) : super(coordinates: coordinates);

  Set<Polyline> getDirectionsJsonData(openRouteDirectionsData) {
    // Create an instance of Class NetworkHelper which uses http package
    // for requesting data to the server and receiving response as JSON format

    try {
      // We can reach to our desired JSON data manually as following
      LineString ls = LineString(
          openRouteDirectionsData['features'][0]['geometry']['coordinates']);

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

  String getDistance(openRouteDirectionsData) {
    double distance = openRouteDirectionsData['features'][0]['properties']
        ['summary']['distance'];
    distance = distance / 1000.0;

    return "${distance.toStringAsFixed(2)} km";
  }

  String getDuration(openRouteDirectionsData) {
    double duration = openRouteDirectionsData['features'][0]['properties']
        ['summary']['duration'];

    int h = duration ~/ 3600;
    int m = ((duration - h * 3600)) ~/ 60;

    String hourLeft =
        h.toString().length < 2 ? "0${h.toString()}" : h.toString();
    String minuteLeft =
        m.toString().length < 2 ? "0${m.toString()}" : m.toString();

    String result = "$hourLeft h $minuteLeft min";

    return result;
  }
}

//Create a new class to hold the Co-ordinates we've received from the response data
class LineString {
  LineString(this.lineString);
  List<dynamic> lineString;
}
