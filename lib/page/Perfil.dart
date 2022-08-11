import 'package:flutter/material.dart';

class Perfil extends StatelessWidget {
  const Perfil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text("Perfil"),),
    body: const Center(
      child: Text("Perfil"),
    ),
  );
}
