import 'package:caronas_usp/widget/appbar_widget.dart';
import 'package:flutter/material.dart';

class HistoricoPage extends StatelessWidget {
  const HistoricoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: buildAppBar(context, "Suas Caronas"),
    body: const Center(
      child: Text("Suas Caronas"),
    ),
  );
}