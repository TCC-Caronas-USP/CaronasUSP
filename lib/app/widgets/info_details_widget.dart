import 'package:caronas_usp/app/core/constants.dart';
import 'package:caronas_usp/app/models/passenger.dart';
import 'package:caronas_usp/app/models/ride.dart';
import 'package:caronas_usp/app/modules/aceitar/ui/aceitar_page.dart';
import 'package:caronas_usp/app/utils/getStatusIcon.dart';
import 'package:caronas_usp/app/widgets/user_image_widget.dart';
import 'package:flutter/material.dart';

Widget InfoDetailsWidget(String title, String subtitle, BuildContext context, Ride ride, AppPage page,
    {bool image = false,
      IconData? icon,
      String? imagePath,
      InfoDetails? infoDetails,
      String? time,
      Passenger? passenger}) {
  return Card(
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
        child: image
            ? UserImage(
          imagePath: imagePath!,
        )
            : Icon(
          icon,
          size: 1000,
        ),
      ),
      trailing: buildInfoDetailsTrailing(infoDetails, time, passenger),
      minLeadingWidth: 20,
    ),
  );
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