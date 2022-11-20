import 'package:caronas_usp/app/core/constants.dart';
import 'package:caronas_usp/app/models/ride.dart';
import 'package:caronas_usp/app/widgets/info_details_widget.dart';
import 'package:caronas_usp/app/widgets/maps_widget.dart';
import 'package:flutter/material.dart';

class DetailsRideWidget extends StatelessWidget {
  final Ride ride;
  final AppPage page;

  const DetailsRideWidget({Key? key, required this.ride, required this.page})
      : super(key: key);

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
        vertical: 24,
      ),
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      children: [
        InfoDetailsWidget(ride.origin.description, "Origem", context, ride,
            page, InfoDetails.location,
            time: departureTimeString),
        InfoDetailsWidget(ride.destination.description, "Destino", context,
            ride, page, InfoDetails.location,
            time: arrivalTimeString),
        Maps(height: 400, locations: ride.locations),
        InfoDetailsWidget(
          "R\$ ${ride.price.toStringAsFixed(2)}",
          "Pago ao final da carona",
          context,
          ride,
          page,
          InfoDetails.price,
        ),
        detailsText("Motorista"),
        InfoDetailsWidget(ride.driver.name, ride.driver.instituto, context,
            ride, page, InfoDetails.driver,
            imagePath: ride.driver.imagePath),
        InfoDetailsWidget(
          ride.driver.vehicles.first.model,
          ride.driver.vehicles.first.licensePlate,
          context,
          ride,
          page,
          InfoDetails.car,
        ),
        detailsText("Caronistas"),
        if (ride.passengers.isEmpty)
          detailsText("Essa carona ainda não possui passageiros", fontSize: 12),
        for (var passenger in ride.passengers)
          InfoDetailsWidget(
              passenger.riderName,
              passenger.riderInstituto,
              context,
              ride,
              page,
              imagePath: passenger.riderImagePath,
              InfoDetails.passenger,
              passenger: passenger),
        const SizedBox(
          height: 64,
        )
      ],
    );
  }

  Widget detailsText(String text, {double? fontSize = 16.0}) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 25),
      child: Text(
        text,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: fontSize),
      ),
    );
  }
}
