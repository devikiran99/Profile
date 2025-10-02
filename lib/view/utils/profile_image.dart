import 'package:flutter/material.dart';

import '../../res/constants.dart';

class ProfileImage extends StatelessWidget {

  final double height;
  final double width;

  const ProfileImage({super.key, this.height = 100, this.width = 100});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(defaultPadding/6),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          gradient: LinearGradient(
            colors: [
              Colors.pink,
              Colors.blue.shade900,
            ],
          ),
          boxShadow: const [
            BoxShadow(color: Colors.pink,blurRadius: 10,offset: Offset(0, 2)),
            BoxShadow(color: Colors.blue,blurRadius: 10,offset: Offset(0, -2)),
          ]
      ),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Transform.rotate(
              angle: 0.0,
              child: Image.asset('assets/utils/profile.jpg',fit: BoxFit.cover,))),
    );
  }
}
