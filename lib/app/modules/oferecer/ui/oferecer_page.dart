import 'package:caronas_usp/widget/appbar_widget.dart';
import 'package:flutter/material.dart';

class OferecerPage extends StatelessWidget {
  const OferecerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: buildAppBar(context, "Oferecer Caronas"),
        body: const Center(
          child: Text("Oferecer Caronas"),
        ),
      );
}
