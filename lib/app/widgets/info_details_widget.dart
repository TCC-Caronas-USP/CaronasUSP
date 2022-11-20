import 'package:caronas_usp/app/core/constants.dart';
import 'package:caronas_usp/app/models/passenger.dart';
import 'package:caronas_usp/app/models/ride.dart';
import 'package:caronas_usp/app/modules/aceitar/ui/aceitar_page.dart';
import 'package:caronas_usp/app/utils/getStatusIcon.dart';
import 'package:caronas_usp/app/widgets/user_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

Widget InfoDetailsWidget(String title, String subtitle, BuildContext context,
    Ride ride, AppPage page, InfoDetails infoDetails,
    {String? imagePath, String? time, Passenger? passenger}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Flexible(
        child: Card(
          margin: const EdgeInsets.all(12),
          elevation: 2,
          child: ListTile(
            enabled: true,
            onTap: () {
              if (page == AppPage.oferecer &&
                  infoDetails == InfoDetails.passenger &&
                  passenger!.status == RidePassengerStatus.waiting) {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        AceitarPage(ride: ride, passenger: passenger)));
              }
            },
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
                child:
                    buildInfoDetailsLeading(infoDetails, imagePath: imagePath)),
            trailing: buildInfoDetailsTrailing(infoDetails, time, passenger),
            minLeadingWidth: 20,
          ),
        ),
      ),
      if (infoDetails == InfoDetails.driver ||
          infoDetails == InfoDetails.passenger)
        IconButton(
          icon: const Icon(Icons.whatsapp, size: 48),
          padding: const EdgeInsets.only(right: 12),
          tooltip: "Conversar no Whatsapp",
          onPressed: () async => {
            if (infoDetails == InfoDetails.driver)
              await canLaunchUrlString("https://wa.me/5511998521261") ? launchUrlString("https://wa.me/55998521261") : print("não foi possível abrir")
          },
        )
    ],
  );
}

Widget buildInfoDetailsLeading(InfoDetails infoDetails, {imagePath}) {
  switch (infoDetails) {
    case InfoDetails.location:
      return const Icon(
        Icons.map,
        size: 1000,
      );
    case InfoDetails.price:
      return const Icon(
        Icons.monetization_on_outlined,
        size: 1000,
      );
    case InfoDetails.car:
      return const Icon(
        Icons.directions_car_filled,
        size: 1000,
      );
    case InfoDetails.whatsapp:
      return const Icon(
        Icons.whatsapp,
        size: 1000,
      );
    default:
      return UserImage(
        imagePath: imagePath!,
      );
  }
}

Widget? buildInfoDetailsTrailing(
    InfoDetails? trailing, String? time, Passenger? passenger) {
  switch (trailing) {
    case InfoDetails.location:
      return Text(
        time!,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(fontSize: 20),
      );
    case InfoDetails.passenger:
      return getStatusIcon(passenger!.status);
    default:
      return null;
  }
}
