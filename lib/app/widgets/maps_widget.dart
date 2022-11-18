import 'package:caronas_usp/app/models/location.dart';
import 'package:caronas_usp/app/utils/maps_directions.dart';
import 'package:caronas_usp/app/utils/maps_bounds_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Maps extends StatefulWidget {
  final double height;
  final List<Location> locations;

  const Maps({Key? key, required this.height, required this.locations})
      : super(key: key);

  @override
  State<Maps> createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  late Set<Polyline> polylines;
  late MapsDirections mapsDirections =
      MapsDirections(coordinates: polylinesCoordinates(widget.locations));
  late String distance;
  late String duration;

  Set<Marker> markersLocation(List<Location> locations) {
    Set<Marker> markers = {};

    for (var i = 0; i < locations.length; i++) {
      Location location = locations[i];

      double bitMapDescriptor;
      if (i == 0 || i == locations.length - 1) {
        bitMapDescriptor = BitmapDescriptor.hueGreen;
      } else {
        bitMapDescriptor = BitmapDescriptor.hueAzure;
      }

      markers.add(Marker(
          markerId: MarkerId((location.id ?? 0).toString()),
          icon: BitmapDescriptor.defaultMarkerWithHue(bitMapDescriptor),
          infoWindow: InfoWindow(
            title: location.description,
          ),
          consumeTapEvents: true,
          position: LatLng(location.lat, location.lon)));
    }

    return Set.from(markers);
  }

  List<List<double>> polylinesCoordinates(List<Location> locations) {
    List<List<double>> coordinates = [];
    for (var location in locations) {
      coordinates.add([location.lon, location.lat]);
    }
    return coordinates;
  }

  // Text("Distância: ${distance}"),
  // Text("Duração: ${duration}"),

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        child: FutureBuilder(
            future: mapsDirections.getPolylinesData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                Location initialLocation = widget.locations[0];
                polylines = mapsDirections.getDirectionsJsonData(snapshot.data);
                duration = mapsDirections.getDuration(snapshot.data);
                distance = mapsDirections.getDistance(snapshot.data);
                return Column(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      child: SizedBox(
                        height: widget.height,
                        child: GoogleMap(
                          markers: markersLocation(widget.locations),
                          polylines: polylines,
                          myLocationEnabled: false,
                          initialCameraPosition: CameraPosition(
                            target: LatLng(
                                initialLocation.lat, initialLocation.lon),
                            zoom: 15,
                          ),
                          onMapCreated: (GoogleMapController controller) {
                            Future.delayed(const Duration(milliseconds: 1000),
                                () {
                              controller.animateCamera(
                                  CameraUpdate.newLatLngBounds(
                                      MapUtils.boundsFromLatLngList(widget
                                          .locations
                                          .map(
                                              (loc) => LatLng(loc.lat, loc.lon))
                                          .toList()),
                                      1));
                            });
                          },
                          gestureRecognizers: <
                              Factory<OneSequenceGestureRecognizer>>{
                            Factory<OneSequenceGestureRecognizer>(
                              () => EagerGestureRecognizer(),
                            ),
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text("Tempo estimado: $duration",
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 14)),
                    Text("Distância da viagem: $distance",
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 14)),
                  ],
                );
              } else {
                return SizedBox(
                  height: widget.height,
                  child: const DecoratedBox(
                      decoration: BoxDecoration(color: Color(0xFFE0E0E0)),
                      child: SpinKitRotatingCircle(
                        color: Colors.green,
                        size: 50.0,
                      )),
                );
              }
            }),
      ),
    );
  }
}
