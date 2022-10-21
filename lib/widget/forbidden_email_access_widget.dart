import 'package:flutter/material.dart';

class ForbiddenEmailAccess extends StatelessWidget {
  const ForbiddenEmailAccess({super.key});

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.all(32),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [

        Spacer(),

        Align(
          alignment: Alignment.center,
          child: Text(
            'Te falta acesso, você é fraco',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        Spacer()
      ],
    ),
  );
}