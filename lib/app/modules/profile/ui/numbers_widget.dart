import 'package:flutter/material.dart';

class NumbersWidget extends StatelessWidget {
  final int caronasUtilizadas;
  final int caronasRealizadas;

  const NumbersWidget({Key? key, required this.caronasRealizadas, required this.caronasUtilizadas}) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      buildButton(context, caronasUtilizadas.toString(), "Utilizadas"),
      buildDivider(),
      buildButton(context, caronasRealizadas.toString(), "Realizadas"),
    ],
  );

  Widget buildDivider() => const SizedBox(
    height: 24,
    child: VerticalDivider(thickness: 2),
  );

  Widget buildButton(BuildContext context, String value, String text) =>
      MaterialButton(
        onPressed: () {},
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
                value,
                style: const TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
                softWrap: true,
            ),
            const SizedBox(height: 2),
            Text(
              text,
              style: const TextStyle(fontSize: 12),
              textAlign: TextAlign.center,
              softWrap: true,
            ),
          ],
        ),
      );

}

