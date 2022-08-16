import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context, String title) {

  return AppBar(
    leading: BackButton(),
    title: Text(title),
    backgroundColor: Colors.green[400],
  );
}
