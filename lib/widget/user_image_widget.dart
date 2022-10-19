import 'package:flutter/material.dart';

class UserImage extends StatelessWidget {
  final String imagePath;

  const UserImage({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var image = NetworkImage(imagePath);

    return ClipOval(
        child: Material(
          color: Colors.transparent,
          child: Ink.image(image: image, width: 64, height: 64),
        )
    );
  }
}
