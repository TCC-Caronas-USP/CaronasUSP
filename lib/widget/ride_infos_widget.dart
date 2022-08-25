import 'package:flutter/material.dart';

class RideInfos extends StatelessWidget {
  const RideInfos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            buildImage(),
            const SizedBox(width: 6,),
            buildRideLocation(),
            const SizedBox(width: 6,),
          ],
        ),
        buildRidePriceAndPeople(),
      ],
    );
  }

  Widget buildImage() {
    const image = NetworkImage(
        "https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80");

    return ClipOval(
        child: Material(
          color: Colors.transparent,
          child: Ink.image(image: image, fit: BoxFit.cover, width: 64, height: 64),
    ));
  }

  Widget buildRideLocation() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          "CEPEUSPPPPPPPPPPPPPPP",
          overflow: TextOverflow.fade,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        const SizedBox(height: 4),
        Container(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (var value in ["Chegando às 17:00", "Partindo de Montreal"])
                  Text(value,
                      style: const TextStyle(fontSize: 16, color: Colors.grey)),
              ],
            ))
      ],
    );
  }

  Widget buildRidePriceAndPeople() {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      const Text(
        "R\$ 5,00",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        textAlign: TextAlign.center,
        softWrap: true,
      ),
      const SizedBox(
        height: 6,
      ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Icon(Icons.people),
          SizedBox(
            width: 6,
          ),
          Text(
            "2/4",
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.left,
            softWrap: true,
          ),
        ],
      )
    ]);
  }
}
