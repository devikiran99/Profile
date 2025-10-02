import 'package:flutter/material.dart';

class GradientTextView extends StatelessWidget {
  final String text;
  final double fontSize;
  final List<Color> gradientColors;

  const GradientTextView({
    super.key,
    required this.text,
    this.fontSize = 20.0,
    this.gradientColors = const [Colors.pink, Colors.blue],
  });

  @override
  Widget build(BuildContext context) {
    final textWidget = Text(
      text,
      style: Theme.of(context).textTheme.labelMedium!.copyWith(
        fontWeight: FontWeight.bold,
        fontSize: fontSize,
      ),
    );

    return ShaderMask(
      shaderCallback: (bounds) => LinearGradient(
        colors: gradientColors!,
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
      blendMode: BlendMode.srcIn,
      child: textWidget,
    );
  }
}
