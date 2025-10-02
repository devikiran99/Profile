import 'package:flutter/material.dart';
import '../../../utils/gradient_divider.dart';
import '../../../utils/profile_image.dart';

class NavDrawerProfile extends StatelessWidget {
  const NavDrawerProfile({super.key});
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.23,
      child: Column(
        children: [
          const Spacer(flex: 2),
          const ProfileImage(),
          const Spacer(),
          Text('Devikiran Shetty ',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w200,
                  height: 1.5,
                  color: Colors.white,
                  fontSize: 24
              )),

          const Text('Software Engineer',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.w200,
                height: 1.5,
              color: Colors.white70,
              fontSize: 18,
            )
          ),

          const Text('Native Android Development, \nFlutter Development',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w200,
                  height: 1.5,
                  color: Colors.white60,
                fontSize: 14,
              )
          ),
          const Spacer(flex: 1,),
          GradientDivider(),
          const Spacer(flex: 1,),
        ],
      ),
    );
  }
}
