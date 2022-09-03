import 'package:caronas_usp/model/ride.dart';
import 'package:caronas_usp/utils/user_offered_rides.dart';
import 'package:caronas_usp/widget/ride_infos_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OfferRide extends StatefulWidget {
  const OfferRide({Key? key}) : super(key: key);

  @override
  State<OfferRide> createState() => _OfferRideState();
}

class _OfferRideState extends State<OfferRide> {
  @override
  Widget build(BuildContext context) {
    const userOfferedRides = UserOfferedRides.myOfferedRides;
    List<List<Ride>> dailyOfferedRides = rideDates(userOfferedRides);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ListView.builder(
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: dailyOfferedRides.length,
              itemBuilder: (context, index) {
                final item = dailyOfferedRides[index];
                final date = item[0].rideDate.substring(0, 10);

                return buildRideDailyOffered(date, item);
              })
        ],
      ),
    );
  }

  List<List<Ride>> rideDates(List<Ride> userOfferedRides) {
    List<String> userOfferedRideDates = [];
    for (final ride in userOfferedRides) {
      var rideDate = ride.rideDate.substring(0, 10);
      userOfferedRideDates.add(rideDate);
    }
    userOfferedRideDates = userOfferedRideDates.toSet().toList()..sort();

    List<List<Ride>> ridesOfTheSameDay = [];
    for (final userOfferedRideDate in userOfferedRideDates) {
      List<Ride> rideOfTheSameDay = [];
      for (final ride in userOfferedRides) {
        if (userOfferedRideDate == ride.rideDate.substring(0, 10)) {
          rideOfTheSameDay.add(ride);
        }
      }
      ridesOfTheSameDay.add(rideOfTheSameDay);
    }

    return ridesOfTheSameDay;
  }

  Widget buildRideDailyOffered(String rideDate, List<Ride> userOfferedRides) {
    DateFormat format = DateFormat("yyyy-MM-dd");
    DateTime rideDateFormatted = format.parse(rideDate);
    String rideYear = rideDateFormatted.year.toString().padLeft(4, "0");
    String rideMonth = rideDateFormatted.month.toString().padLeft(2, "0");
    String rideDay = rideDateFormatted.day.toString().padLeft(2, "0");

    return Column(children: [
      Text(
        " $rideDay/$rideMonth/$rideYear",
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        textAlign: TextAlign.center,
        softWrap: true,
      ),
      const SizedBox(
        height: 6,
      ),
      for (var ride in userOfferedRides) RideInfos(rideInfos: ride),
      const SizedBox(
        height: 16,
      ),
    ]);
  }
}