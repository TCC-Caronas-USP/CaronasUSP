import 'package:caronas_usp/app/models/passenger.dart';
import 'package:caronas_usp/app/models/ride.dart';
import 'package:caronas_usp/app/widgets/appbar_backbutton_widget.dart';
import 'package:flutter/material.dart';

class AceitarPage extends StatefulWidget {
  final Ride ride;
  final Passenger passenger;

  AceitarPage({Key? key, required this.ride, required this.passenger})
      : super(key: key);

  @override
  State<AceitarPage> createState() => _AceitarPageState();
}

class _AceitarPageState extends State<AceitarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBarBackButton(context, "Aceitar Caronista"),
        body: ListView(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 24,
            ),
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            children: [
              const Text(
                "Localização",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ]));
  }
}
