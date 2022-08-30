import 'package:caronas_usp/widget/appbar_widget.dart';
import 'package:flutter/material.dart';

class PegarPage extends StatelessWidget {
  const PegarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: buildAppBar(context, "Pegar Caronas"),
        body: const Center(
          child: Text("Pegar Caronas"),
        ),
      );
}
