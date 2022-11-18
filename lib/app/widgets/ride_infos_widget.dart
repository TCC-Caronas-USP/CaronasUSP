import 'package:caronas_usp/app/core/constants.dart';
import 'package:caronas_usp/app/modules/detalhes/ui/detalhes_page.dart';
import 'package:caronas_usp/app/models/ride.dart';
import 'package:caronas_usp/app/models/rider.dart';
import 'package:flutter/material.dart';

class RideInfosWidget extends StatelessWidget {
  final Ride ride;
  final Rider rider;
  final AppPage page;

  const RideInfosWidget({
    Key? key,
    required this.ride,
    required this.rider,
    required this.page,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 2,
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => DetalhesPage(ride: ride, page: page)));
            },
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        buildImage(ride.driver.imagePath),
                        const SizedBox(
                          width: 12,
                        ),
                        buildRideLocation(ride.destination.description,
                            ride.origin.description, ride.arrivalTime),
                        const SizedBox(
                          width: 12,
                        ),
                      ],
                    ),
                  ),
                  ride.isPassenger(rider)
                      ? buildRideStatus(ride.getStatus(rider))
                      : buildRidePriceAndPeople(ride.price,
                          ride.currentNumPassengers, ride.maxNumPassengers),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 6,
        )
      ],
    );
  }

  Widget buildImage(String imagePath) {
    final image = NetworkImage(imagePath);

    return ClipOval(
        child: Material(
      color: Colors.transparent,
      child: Ink.image(image: image, fit: BoxFit.cover, width: 64, height: 64),
    ));
  }

  Widget buildRideLocation(
      String destination, String origin, DateTime rideDate) {
    String rideHour = rideDate.hour.toString().padLeft(2, "0");
    String rideMinute = rideDate.minute.toString().padLeft(2, "0");

    return Flexible(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          destination,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        const SizedBox(height: 4),
        Container(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (var value in [
                  "Chegando às $rideHour:$rideMinute",
                  "Partindo de $origin"
                ])
                  Text(value,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 16, color: Colors.grey)),
              ],
            ))
      ],
    ));
  }

  Widget buildRidePriceAndPeople(
      double price, int currentOccupation, int totalOccupation) {
    String ridePrice = price.toStringAsFixed(2);
    String rideCurrentOccupation = currentOccupation.toString();
    String rideTotalOccupation = totalOccupation.toString();

    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Text(
        "R\$ $ridePrice",
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        textAlign: TextAlign.center,
        softWrap: true,
      ),
      const SizedBox(
        height: 6,
      ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(Icons.people),
          const SizedBox(
            width: 6,
          ),
          Text(
            "$rideCurrentOccupation/$rideTotalOccupation",
            style: const TextStyle(fontSize: 16),
            textAlign: TextAlign.left,
            softWrap: true,
          ),
        ],
      )
    ]);
  }

  Widget buildRideStatus(RidePassengerStatus status) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: 10,
          ),
          _getIcon(status),
          const SizedBox(
            width: 10,
          ),
        ],
      )
    ]);
  }

  Icon _getIcon(RidePassengerStatus status) {
    switch (status) {
      case RidePassengerStatus.approved:
        return const Icon(
          Icons.check,
          size: 30,
        );
      case RidePassengerStatus.waiting:
        return const Icon(
          Icons.access_time_filled,
          size: 30,
        );
      case RidePassengerStatus.rejected:
        return const Icon(
          Icons.close,
          size: 30,
        );
      default:
        return const Icon(
          Icons.question_mark,
          size: 30,
        );
    }
  }
}