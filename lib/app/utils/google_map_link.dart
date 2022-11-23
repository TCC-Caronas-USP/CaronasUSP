import 'package:caronas_usp/app/models/location.dart';
import 'package:caronas_usp/app/models/ride.dart';

Uri constructGoogleMapLink(Ride ride) {
  List<Location> rideLocations = ride.locations;
  String origin = buildLatLonUrl(rideLocations.removeAt(0));
  String destination = buildLatLonUrl(rideLocations.removeLast());
  String waypoints =
  rideLocations.map((location) => buildLatLonUrl(location)).join("|");

  return Uri(
      scheme: "https",
      host: "www.google.com",
      path: 'maps/dir/',
      queryParameters: {
        "api": "1",
        "origin": origin,
        "destination": destination,
        "travelmode": "driving",
        "waypoints": waypoints
      });
}

String buildLatLonUrl(Location location) {
  return "${location.lat},${location.lon}";
}