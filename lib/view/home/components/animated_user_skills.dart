import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class AnimatedUserSkills extends StatelessWidget {
  final List<String> skills = [
    'Mobile Dev',
    'Android',
    'Kotlin',
    'Jetpack Compose',
    'Flutter',
  ];

  AnimatedUserSkills({super.key});

  @override
  Widget build(BuildContext context) {
    const gradientColors = [Colors.pink, Colors.blue];

    return Row(
      children: [
        Text(
          "I'm into ",
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: Colors.grey, wordSpacing: 2, fontSize: 24),
        ),
        ShaderMask(
          shaderCallback: (bounds) {
            return const LinearGradient(
              colors: gradientColors,
            ).createShader(bounds);
          },
          child: AnimatedTextKit(
            repeatForever: true,
            pause: Duration(milliseconds: 800),
            animatedTexts: skills
                .map(
                  (skill) => TypewriterAnimatedText(
                skill,
                textStyle: TextStyle(
                  fontSize: 26,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                speed: Duration(milliseconds: 130),
                cursor: '|',
              ),
            )
                .toList(),
          ),
        ),
      ],
    );
  }
}
