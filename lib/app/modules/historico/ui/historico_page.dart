import 'package:caronas_usp/utils/maps_open_route_service.dart';
import 'package:caronas_usp/utils/maps_utils.dart';
import 'package:caronas_usp/widget/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HistoricoPage extends StatefulWidget {
  const HistoricoPage({Key? key}) : super(key: key);

  @override
  State<HistoricoPage> createState() => _HistoricoPageState();
}

class _HistoricoPageState extends State<HistoricoPage> {
  late CameraPosition _initialPosition;

  double poliLat = -23.556977524989904, poliLon = -46.73021254499231;
  double leoJaraguaLat = -23.44288937672896, leoJaraguaLon = -46.74567834507152;
  double shoppingBarueriLat = -23.515528633356567,
      shoppingBarueriLon = -46.85547716990059;
  double neoquimicaArenaLat = -23.54508598126952,
      neoquimicaArenaLon = -46.47424616453793;

  final List<LatLng> polyPoints = []; // For holding Co-ordinates as LatLng
  final Set<Polyline> polyLines = {}; // For holding instance of Polyline

  void getJsonData(coordinates) async {
    // Create an instance of Class NetworkHelper which uses http package
    // for requesting data to the server and receiving response as JSON format

    NetworkHelper network = NetworkHelper(
      coordinates: coordinates
    );

    try {
      // getData() returns a json Decoded data
      var data = await network.getData();

      // We can reach to our desired JSON data manually as following
      LineString ls = LineString(data['features'][0]['geometry']['coordinates']);
      // LineString(data['features'][0]['properties']['summary'])

      for (int i = 0; i < ls.lineString.length; i++) {
        polyPoints.add(LatLng(ls.lineString[i][1], ls.lineString[i][0]));
      }

      if (polyPoints.length == ls.lineString.length) {
        setPolyLines();
      }
    } catch (e) {
      print(e);
    }
  }

  setPolyLines() {
    Polyline polyline = Polyline(
      polylineId: const PolylineId("polyline"),
      color: Colors.lightBlue,
      points: polyPoints,
    );
    polyLines.add(polyline);
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initialPosition = CameraPosition(
      target: LatLng(shoppingBarueriLat,
          shoppingBarueriLon), //TODO this come from user input
      zoom: 14.4746,
    );

    getJsonData([[shoppingBarueriLon, shoppingBarueriLat], [leoJaraguaLon, leoJaraguaLat], [poliLon, poliLat]]);
  }

  @override
  Widget build(BuildContext context) {
    Set<Marker> markers = {
      Marker(
          markerId: const MarkerId('start'),
          position: LatLng(shoppingBarueriLat, shoppingBarueriLon)),
      Marker(
          markerId: const MarkerId('middle1'),
          position: LatLng(leoJaraguaLat, leoJaraguaLon),
          // infoWindow: const InfoWindow(title: "Title")
      ),
      Marker(
          markerId: const MarkerId('end'),
          position: LatLng(poliLat, poliLon)),
    };

    return Scaffold(
      appBar: buildAppBar(context, "Suas Caronas"),
      body: GoogleMap(
        initialCameraPosition: _initialPosition,
        markers: Set.from(markers),
        polylines: polyLines,
        onMapCreated: (GoogleMapController controller) {
          Future.delayed(const Duration(milliseconds: 2500), () {
            controller.animateCamera(CameraUpdate.newLatLngBounds(
                MapUtils.boundsFromLatLngList(
                    markers.map((loc) => loc.position).toList()),
                1));
          });
        },
      ),
      extendBody: false,
    );
  }
}


//Create a new class to hold the Co-ordinates we've received from the response data
class LineString {
  LineString(this.lineString);
  List<dynamic> lineString;
}
