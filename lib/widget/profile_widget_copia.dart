import 'package:flutter/material.dart';

// peguei do miguel

class ProfileWidgetImmutable extends StatelessWidget {
  final String imagePath;

  const ProfileWidgetImmutable({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final color = Theme.of(context).colorScheme.primary;

    return Center(
      child: Stack(
        children: [
          buildImage(),
          /*Positioned(
            bottom: 0,
            right: 4,
            child: buildEditIcon(color),
          )*/
        ],
      ),
    );
  }

  Widget buildImage(){
    final image = NetworkImage(imagePath);

    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: Ink.image(
          image: image,
          fit: BoxFit.cover,
          width: 128,
          height: 128,
        ),
      )
    );
  }

  Widget buildEditIcon(Color color) => buildCircle(
      all: 3,
      color: Colors.white,
      child: buildCircle(
        color: color,
        all: 8,
        child: const Icon(
          Icons.edit,
          color: Colors.white,
          size: 20,
        )
      ),
  );

  Widget buildCircle({
    required Widget child,
    required double all,
    required Color color,
  }) => ClipOval(
    child: Container(
      padding: EdgeInsets.all(all),
      color: color,
      child: child,
    ),
  );

}
