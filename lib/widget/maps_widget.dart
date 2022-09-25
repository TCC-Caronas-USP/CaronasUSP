import 'package:caronas_usp/model/location.dart';
import 'package:caronas_usp/utils/maps_directions.dart';
import 'package:caronas_usp/utils/maps_utils.dart';
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
          markerId: MarkerId(location.id),
          icon: BitmapDescriptor.defaultMarkerWithHue(bitMapDescriptor),
          infoWindow: InfoWindow(
            title: location.description,
          ),
          consumeTapEvents: true,
          position: LatLng(location.lat, location.lon)));
    }

    return Set.from(markers);
  }

  Future<Set<Polyline>> polylinesDirections(List<Location> locations) {
    List<List<double>> coordinates = [];
    for (var location in locations) {
      coordinates.add([location.lon, location.lat]);
    }

    MapsDirections mapsDirections = MapsDirections(coordinates: coordinates);
    return mapsDirections.getDirectionsJsonData();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        child: SizedBox(
            height: widget.height,
            child: FutureBuilder(
                future: polylinesDirections(widget.locations),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    Location initialLocation = widget.locations[0];
                    polylines = snapshot.data as Set<Polyline>;
                    return GoogleMap(
                      markers: markersLocation(widget.locations),
                      polylines: polylines,
                      initialCameraPosition: CameraPosition(
                        target:
                            LatLng(initialLocation.lat, initialLocation.lon),
                        zoom: 15,
                      ),
                      onMapCreated: (GoogleMapController controller) {
                        Future.delayed(const Duration(milliseconds: 1000), () {
                          controller.animateCamera(CameraUpdate.newLatLngBounds(
                              MapUtils.boundsFromLatLngList(widget.locations
                                  .map((loc) => LatLng(loc.lat, loc.lon))
                                  .toList()),
                              1));
                        });
                      },
                    );
                  } else {
                    return const DecoratedBox(
                        decoration: BoxDecoration(color: Color(0xFFE0E0E0)),
                        child: SpinKitRotatingCircle(
                          color: Colors.green,
                          size: 50.0,
                        ));
                  }
                })),
      ),
    );
  }
}
