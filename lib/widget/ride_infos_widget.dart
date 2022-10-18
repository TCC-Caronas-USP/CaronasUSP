import 'package:caronas_usp/app/modules/detalhes/ui/detalhes_page.dart';
import 'package:caronas_usp/model/ride.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RideInfos extends StatelessWidget {
  final Ride rideInfos;
  final bool isMyRide;

  const RideInfos({Key? key, required this.rideInfos, this.isMyRide = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 2,
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => DetalhesPage(rideId: rideInfos.rideId,)));
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
                        buildImage(rideInfos.driverUsers.imagePath),
                        const SizedBox(
                          width: 12,
                        ),
                        buildRideLocation(rideInfos.destinyPlace,
                            rideInfos.sourcePlace, rideInfos.rideDestinyDatetime),
                        const SizedBox(
                          width: 12,
                        ),
                      ],
                    ),
                  ),
                  isMyRide
                      ? buildRideStatus(rideInfos.myRideStatus!)
                      : buildRidePriceAndPeople(
                          rideInfos.price,
                          rideInfos.currentOccupation,
                          rideInfos.totalOccupation),
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

  Widget buildRideLocation(String destiny, String source, String rideDate) {
    DateFormat format = DateFormat("yyyy-MM-dd hh:mm:ss");
    DateTime rideTime = format.parse(rideDate);
    String rideHour = rideTime.hour.toString().padLeft(2, "0");
    String rideMinute = rideTime.minute.toString().padLeft(2, "0");

    return Flexible(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          destiny,
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
                  "Partindo de $source"
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

  Widget buildRideStatus(String status) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: 10,
          ),
          _getCorrectIcon(status),
          const SizedBox(
            width: 10,
          ),
        ],
      )
    ]);
  }

  Icon _getCorrectIcon(String status) {
    switch (status) {
      case 'approved':
        return const Icon(
          Icons.check,
          size: 30,
        );
      case 'waiting':
        return const Icon(
          Icons.access_time_filled,
          size: 30,
        );
      case 'rejected':
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
