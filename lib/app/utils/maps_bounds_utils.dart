import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapUtils {
  static LatLngBounds boundsFromLatLngList(List<LatLng> list) {
    double? x0, x1, y0, y1;
    double? d1, d2;

    for (LatLng latLng in list) {
      if (x0 == null) {
        x0 = x1 = latLng.latitude;
        y0 = y1 = latLng.longitude;
      } else {
        if (latLng.latitude > x1!) x1 = latLng.latitude;
        if (latLng.latitude < x0) x0 = latLng.latitude;
        if (latLng.longitude > y1!) y1 = latLng.longitude;
        if (latLng.longitude < y0!) y0 = latLng.longitude;
      }
    }

    d1 = 0.2 * (x0! - x1!).abs(); // 0.015
    d2 = 0.2 * (y0! - y1!).abs(); // 0.015

    return LatLngBounds(
        northeast: LatLng(x1 + d1, y1 + d2),
        southwest: LatLng(x0 - d1, y0 - d2));
  }
}