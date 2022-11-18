import 'package:caronas_usp/app/core/constants.dart';
import 'package:caronas_usp/app/models/ride.dart';
import 'package:caronas_usp/app/models/rider.dart';
import 'package:caronas_usp/app/widgets/ride_infos_widget.dart';
import 'package:flutter/material.dart';

class RidesListWidget extends StatelessWidget {
  final List<List<Ride>> ridesPerDate;
  final AppPage page;
  final Rider rider;

  const RidesListWidget(
      {Key? key,
      required this.ridesPerDate,
      required this.page,
      required this.rider})
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
        itemCount: ridesPerDate.length,
        itemBuilder: (context, index) {
          final item = ridesPerDate[index];
          final date = item[0].arrivalTime;

          return buildRideDailyOffered(date, item, page);
        });
  }

  Widget buildRideDailyOffered(
      DateTime rideDate, List<Ride> ridesPerDate, AppPage page) {
    String rideYear = rideDate.year.toString().padLeft(4, "0");
    String rideMonth = rideDate.month.toString().padLeft(2, "0");
    String rideDay = rideDate.day.toString().padLeft(2, "0");

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
      for (var ride in ridesPerDate)
        RideInfosWidget(
          ride: ride,
          rider: rider,
          page: page,
        ),
      const SizedBox(
        height: 16,
      ),
    ]);
  }
}
