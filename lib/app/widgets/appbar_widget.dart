import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context, String title, [IconButton? button]) {

  return AppBar(
    // leading: const SizedBox(width: 24),
    title: Text(title),
    backgroundColor: Colors.green[400],
    leading: button,
  );
}
