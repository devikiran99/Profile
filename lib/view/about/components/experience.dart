import 'package:flutter/material.dart';
import '../../../model/experience_model.dart';
import '../../../view model/responsive.dart';

class Experience extends StatefulWidget {
  const Experience({super.key});

  @override
  State<Experience> createState() => _ExperienceState();
}

class _ExperienceState extends State<Experience> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _titleAnim;
  late List<Animation<double>> _itemAnimations;



  @override
  void initState() {
    super.initState();

    final int itemCount = experiences.length;
    final totalAnimDuration = 1800;
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: totalAnimDuration));
    _titleAnim = CurvedAnimation(parent: _controller, curve: Interval(0.0, 0.15));

    // Create staggered animation intervals for each experience
    _itemAnimations = List.generate(itemCount, (index) {
      final start = 0.2 + (index * (0.6 / itemCount));
      final end = start + (0.6 / itemCount);
      return CurvedAnimation(
        parent: _controller,
        curve: Interval(start, end, curve: Curves.easeOut),
      );
    });

    _controller.forward();
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FadeTransition(
          opacity: _titleAnim,
          child: Row(
            mainAxisAlignment: Responsive.isTablet(context) ? MainAxisAlignment.center : MainAxisAlignment.start,
            children: [
              Icon(Icons.work, size: 28, color: Colors.white60),
              SizedBox(width: 8),
              Text(
                'Experience',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ],
          ),
        ),
        SizedBox(height: 24),
        ListView.builder(
          itemCount: experiences.length,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            bool isFirst = index == 0;
            bool isLast = index == experiences.length - 1;
            return FadeTransition(
              opacity: _itemAnimations[index],
              child: _expCard(index, experiences[index], isFirst: isFirst, isLast: isLast),
            );
          },
        )
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _expCard(int index, ExperienceModel exp, {bool isFirst = false, bool isLast = false}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Timeline & icon column
        Column(
          children: [
            Container(
              width: 6,
              height: isFirst ? 36 : 80,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.indigo.shade900,
                    Colors.indigo.shade400,
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.indigo, width: 2),
              ),
              child: Icon(Icons.work, color: Colors.indigo[600], size: 30),
            ),
            Container(
              width: 6,
              height: isLast ? 36 : 80,
              color: Colors.indigo[900],
            ),
          ],
        ),

        CustomPaint(
          painter: ArrowPainter(),
          child: SizedBox(width: 16, height: 100),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(bottom: 24),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: const LinearGradient(colors: [
                  Colors.pink,
                  Colors.blue,
                ]),
                boxShadow:  [
                  BoxShadow(
                    color: Colors.pink,
                    offset: const Offset(-2, 0),
                    blurRadius:  10,
                  ),
                  BoxShadow(
                    color: Colors.blue,
                    offset: const Offset(2, 0),
                    blurRadius:  10,),
                ]),
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(exp.title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white)),
                const SizedBox(height: 6),
                Text(exp.role, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.white70)),
                const SizedBox(height: 2),
                Text(exp.period, style: TextStyle(color: Colors.white70, fontSize: 15)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// Painter code remains the same
class ArrowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.lightBlueAccent
      ..strokeWidth = 4
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(0, size.height / 2);
    path.lineTo(size.width - 4, size.height / 2 - 10);
    path.lineTo(size.width - 4, size.height / 2 + 10);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}





