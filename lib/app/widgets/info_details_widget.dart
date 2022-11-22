import 'package:caronas_usp/app/core/constants.dart';
import 'package:caronas_usp/app/models/ride.dart';
import 'package:caronas_usp/app/models/rider.dart';
import 'package:caronas_usp/app/modules/aceitar/ui/aceitar_page.dart';
import 'package:caronas_usp/app/utils/get_status.dart';
import 'package:caronas_usp/app/widgets/user_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

Widget InfoDetailsWidget(String title, String subtitle, BuildContext context,
    Ride ride, AppPage page, InfoDetails infoDetails,
    {String? imagePath, String? time, Rider? rider}) {
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
                  rider!.passenger!.status == RidePassengerStatus.waiting) {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        AceitarPage(ride: ride, rider: rider)));
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
            trailing: buildInfoDetailsTrailing(infoDetails, time, rider),
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

            if (infoDetails == InfoDetails.driver){
              if (await canLaunchUrlString("https://wa.me/${ride.driver.phoneNumber}"))
                await launchUrlString("https://wa.me/${ride.driver.phoneNumber.replaceAll("(", "").replaceAll(")", "").replaceAll(" ", "")}", mode: LaunchMode.externalApplication)
              else
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Não foi possível abrir o Whatsapp.")))
            }
            else if (infoDetails == InfoDetails.passenger){
              if (await canLaunchUrlString("https://wa.me/${rider!.phoneNumber}"))
                await launchUrlString("https://wa.me/55${rider.phoneNumber.replaceAll("(", "").replaceAll(")", "").replaceAll(" ", "")}", mode: LaunchMode.externalApplication)
              else
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Não foi possível abrir o Whatsapp.")))
            }

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
    InfoDetails? trailing, String? time, Rider? rider) {
  switch (trailing) {
    case InfoDetails.location:
      return Text(
        time!,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(fontSize: 20),
      );
    case InfoDetails.passenger:
      return getStatusIcon(rider!.passenger!.status);
    default:
      return null;
  }
}
