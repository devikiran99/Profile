import 'package:flutter/material.dart';

class GradientDivider extends StatelessWidget {
  final double height;
  final double width;
  final List<Color> gradientColor;

  const GradientDivider({super.key, this.height = 2, this.width = double.infinity, this.gradientColor = const [Colors.pink, Colors.blue]});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColor,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
