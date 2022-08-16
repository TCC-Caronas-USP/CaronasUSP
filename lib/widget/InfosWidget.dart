import 'package:flutter/material.dart';

class InfosWidget extends StatelessWidget {
  final String infoTitle;
  final String infoValue;

  const InfosWidget({Key? key, required this.infoTitle, required this.infoValue}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 48),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Divider(thickness: 2),
        const SizedBox(height: 12),
        Text(
          infoTitle,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
          child: Text(
            infoValue,
            style: const TextStyle(fontSize: 16, color: Colors.grey),
          ),
        )
      ],
    ),
  );
}

