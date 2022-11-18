import 'package:caronas_usp/app/models/ride.dart';
import 'package:caronas_usp/app/widgets/maps_widget.dart';
import 'package:caronas_usp/app/modules/detalhes/ui/user_image_widget.dart';
import 'package:flutter/material.dart';

class DetailsRideWidget extends StatelessWidget {
  final Ride ride;

  const DetailsRideWidget({Key? key, required this.ride}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime arrivalTime = ride.arrivalTime;
    String arrivalHour = arrivalTime.hour.toString().padLeft(2, "0");
    String arrivalMinute = arrivalTime.minute.toString().padLeft(2, "0");
    String arrivalTimeString = "$arrivalHour:$arrivalMinute";

    DateTime departureTime = ride.departureTime;
    // departureTime = departureTime.subtract(const Duration(hours: 1, minutes: 30)); // TODO confirmar porque é feito esse subtract
    String departureHour = departureTime.hour.toString().padLeft(2, "0");
    String departureMinute = departureTime.minute.toString().padLeft(2, "0");
    String departureTimeString = "$departureHour:$departureMinute";

    return ListView(
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
        buildInfoDetails(ride.origin.description, "Origem",
            icon: Icons.map, time: departureTimeString),
        buildInfoDetails(ride.destination.description, "Destino",
            icon: Icons.map, time: arrivalTimeString),
        Maps(height: 400, locations: ride.locations),
        const Text(
          "Preço",
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        buildInfoDetails(
            "R\$ ${ride.price.toStringAsFixed(2)}", "Pago ao final da carona",
            icon: Icons.monetization_on_outlined),
        const Text(
          "Motorista",
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        buildInfoDetails(ride.driver.name, ride.driver.instituto,
            image: true, imagePath: ride.driver.imagePath),
        buildInfoDetails(
            ride.driver.vehicles.first.model, ride.driver.vehicles.first.licensePlate,
            icon: Icons.directions_car_filled),
        const Text(
          "Caronista",
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        for (var passenger in ride.passengers)
          buildInfoDetails(passenger.riderName, passenger.riderInstituto,
              image: true, imagePath: passenger.riderImagePath),
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
          overflow: TextOverflow.fade,
          style: const TextStyle(fontSize: 16),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(fontSize: 12),
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
        minLeadingWidth: 20,
      ),
    );
  }
}
