import 'package:caronas_usp/widget/ride_infos_widget.dart';
import 'package:flutter/material.dart';

class OfferRide extends StatelessWidget {
  // final VoidCallback onClicked;

  // const OfferRide({Key? key, required this.onClicked}) : super(key: key);
  const OfferRide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 24),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const <Widget>[
        SizedBox(height: 12,),
        Text(
          "23/08/2022",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          textAlign: TextAlign.center,
          softWrap: true,
        ),
        SizedBox(height: 12,),
        RideInfos(),
        SizedBox(height: 12,),
        RideInfos(),
      ],
    ),
  );
}

