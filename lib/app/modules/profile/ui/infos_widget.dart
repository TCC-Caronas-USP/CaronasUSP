import 'package:flutter/material.dart';

class InfosWidget extends StatelessWidget {
  final String infoTitle;
  final List<String> infoValues;

  const InfosWidget(
      {Key? key, required this.infoTitle, required this.infoValues})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Divider(thickness: 2),
            const SizedBox(height: 12),
            Text(
              infoTitle,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 4),
            Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (var value in infoValues)
                      Text(value,
                          style: const TextStyle(
                              fontSize: 12, color: Colors.grey)),
                  ],
                ))
          ],
        ),
      );
}
