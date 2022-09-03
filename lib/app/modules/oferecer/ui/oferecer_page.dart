import 'package:caronas_usp/widget/appbar_widget.dart';
import 'package:caronas_usp/widget/offer_ride_widget.dart';
import 'package:flutter/material.dart';

class OferecerPage extends StatefulWidget {
  const OferecerPage({Key? key}) : super(key: key);

  @override
  State<OferecerPage> createState() => _OferecerPageState();
}

class _OferecerPageState extends State<OferecerPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: buildAppBar(context, "Oferecer Caronas"),
        body: ListView(
            physics: const BouncingScrollPhysics(),
            children: const [
              SizedBox(height: 24,),
              OfferRide(),
              SizedBox(height: 24,),
        ]));
  }
}
