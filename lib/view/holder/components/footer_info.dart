import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../utils/gradient_divider.dart';
import 'appbar_text_button.dart';

class FooterInfo extends StatelessWidget {
  const FooterInfo({super.key});

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(color: Colors.white70, fontSize: 14);
    return Column(
      children: [
        GradientDivider(gradientColor: [Colors.grey.shade800, Colors.grey.shade700, Colors.grey.shade600], height: 0.5),
        Row(
         mainAxisAlignment: MainAxisAlignment.center,
         crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Designed with ', style: textStyle),
            const Icon(Icons.favorite, color: Colors.red, size: 16),
            const Text(' by ', style: textStyle),
            AppBarTextButton(
              gradientColors: const [Colors.pink, Colors.blue],
              fontSize: 24,
              text: 'Devikiran',
              onTap: () {
                launchUrl(Uri.parse('https://www.linkedin.com/in/devikiran-shetty-6899a9191/'));
              },
            ),
          ],
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Icon(Icons.copyright, size: 12, color: Colors.white38),
            SizedBox(width: 4),
            Text('All rights reserved', style: TextStyle(color: Colors.white38, fontSize: 10)),
          ],
        ),
      ],
    );
  }
}
