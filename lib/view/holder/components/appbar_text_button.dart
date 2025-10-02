import 'package:flutter/material.dart';

class AppBarTextButton extends StatefulWidget {
  final VoidCallback onTap;
  final String text;
  final double fontSize;
  final List<Color> gradientColors;
  final bool isSelected;

  const AppBarTextButton({
    super.key,
    required this.onTap,
    required this.text,
    this.fontSize = 20.0,
    this.gradientColors = const [Colors.white, Colors.white],
    this.isSelected = false,
  });

  @override
  State<AppBarTextButton> createState() => _AppBarTextButtonState();
}

class _AppBarTextButtonState extends State<AppBarTextButton> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    bool active = widget.isSelected || _isHovering;
    Color activeColor = Colors.blue;
    TextStyle baseStyle = Theme.of(context).textTheme.labelMedium!.copyWith(
      fontWeight: FontWeight.bold,
      fontSize: widget.fontSize,
      color: active ? activeColor : (widget.gradientColors.isEmpty ? Colors.white : null),
      decoration: active ? TextDecoration.underline : TextDecoration.none,
    );

    final textWidget = Text(widget.text, style: baseStyle);

    Widget childWidget;
    if (widget.gradientColors.length >= 2 && !active) {
      childWidget = ShaderMask(
        shaderCallback: (bounds) => LinearGradient(
          colors: widget.gradientColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
        blendMode: BlendMode.srcIn,
        child: textWidget,
      );
    } else {
      childWidget = textWidget;
    }

    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _isHovering = true;
        });
      },
      onExit: (_) {
        setState(() {
          _isHovering = false;
        });
      },
      cursor: SystemMouseCursors.click,
      child: TextButton(
        onPressed: widget.onTap,
        child: childWidget,
      ),
    );
  }
}

