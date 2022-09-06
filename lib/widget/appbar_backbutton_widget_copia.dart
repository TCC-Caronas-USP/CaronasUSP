import 'package:flutter/material.dart';

// peguei do miguel

AppBar buildAppBarBackButton(BuildContext context, String title) {

  return AppBar(
    leading: const BackButton(),
    title: Text(title),
    backgroundColor: Colors.green[400],
  );
}