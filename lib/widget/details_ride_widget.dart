import 'package:caronas_usp/model/ride.dart';
import 'package:caronas_usp/widget/user_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';

class DetailsRide extends StatelessWidget {
  final Ride ride;

  const DetailsRide({Key? key, required this.ride}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateFormat format = DateFormat("yyyy-MM-dd hh:mm:ss");
    DateTime rideTime = format.parse(ride.rideDestinyDatetime);
    String rideHour = rideTime.hour.toString().padLeft(2, "0");
    String rideMinute = rideTime.minute.toString().padLeft(2, "0");
    String rideTimeToArrive = "$rideHour:$rideMinute";

    DateTime rideSourceTime = format.parse(ride.rideDestinyDatetime);
    rideSourceTime =
        rideSourceTime.subtract(const Duration(hours: 1, minutes: 30));
    String rideSourceHour = rideSourceTime.hour.toString().padLeft(2, "0");
    String rideSourceMinute = rideSourceTime.minute.toString().padLeft(2, "0");
    String rideSourceTimeToLeft = "$rideSourceHour:$rideSourceMinute";

    return ListView(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 24,
      ),
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      children: [
        buildInfoDetails(ride.destinyPlace, "Destino",
            icon: Icons.map, time: rideTimeToArrive),
        buildInfoDetails(ride.sourcePlace, "Origem",
            icon: Icons.map, time: rideSourceTimeToLeft),
        buildInfoDetails("R\$ ${ride.price.toStringAsFixed(2)}", "Pago ao final da carona",
            icon: Icons.monetization_on_outlined),
        const Text(
          "Motorista",
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        buildInfoDetails(ride.driverUsers.name, ride.driverUsers.instituto,
            image: true, imagePath: ride.driverUsers.imagePath),
        buildInfoDetails(
            ride.driverUsers.veiculoModelo, ride.driverUsers.veiculoPlaca,
            icon: Icons.directions_car_filled),
        const Text(
          "Usuários",
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        for (var consumerUser in ride.consumersUsers) buildInfoDetails(consumerUser.name, consumerUser.instituto, image: true, imagePath: consumerUser.imagePath),
      ],
    );
  }

  Widget buildInfoDetails(String title, String subtitle,
      {bool image = false, IconData? icon, String? imagePath, String? time}) {
    return Card(
      margin: const EdgeInsets.all(12),
      elevation: 2,
      child: ListTile(
        title: Text(
          title,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        subtitle: Text(
          subtitle,
        ),
        leading: FittedBox(
          alignment: Alignment.center,
          fit: BoxFit.contain,
          child: image
              ? UserImage(
                  imagePath: imagePath!,
                )
              : Icon(
                  icon,
                  size: 1000,
                ),
        ),
        trailing: time != null
            ? Text(
                time,
                overflow: TextOverflow.ellipsis,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              )
            : null,
        minLeadingWidth: 32,
      ),
    );
  }
}
