import 'package:caronas_usp/app/core/constants.dart';
import 'package:caronas_usp/model/ride.dart';
import 'package:caronas_usp/widget/ride_infos_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OfferRide extends StatelessWidget {
  final List<List<Ride>> userOfferedRides;
  final AppPage page;

  const OfferRide(
      {Key? key, required this.userOfferedRides, required this.page})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
          vertical: 24,
        ),
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: userOfferedRides.length,
        itemBuilder: (context, index) {
          final item = userOfferedRides[index];
          final date = item[0].rideDestinyDatetime.substring(0, 10);

          return buildRideDailyOffered(date, item, page);
        });
  }

  Widget buildRideDailyOffered(
      String rideDate, List<Ride> userOfferedRides, AppPage page) {
    DateFormat format = DateFormat("yyyy-MM-dd");
    DateTime rideDateFormatted = format.parse(rideDate);
    String rideYear = rideDateFormatted.year.toString().padLeft(4, "0");
    String rideMonth = rideDateFormatted.month.toString().padLeft(2, "0");
    String rideDay = rideDateFormatted.day.toString().padLeft(2, "0");

    return Column(children: [
      Text(
        "$rideDay/$rideMonth/$rideYear",
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        textAlign: TextAlign.center,
        softWrap: true,
      ),
      const SizedBox(
        height: 6,
      ),
      for (var ride in userOfferedRides)
        RideInfos(
          rideInfos: ride,
          isMyRide: ride.myRideStatus == null ? false : true,
          page: page,
        ),
      const SizedBox(
        height: 16,
      ),
    ]);
  }
}
