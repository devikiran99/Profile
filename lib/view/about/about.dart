import 'package:flutter/material.dart';
import '../../res/constants.dart';
import '../home/components/resume_download_button.dart';
import '../utils/gradient_divider.dart';
import '../../view model/responsive.dart';
import 'components/experience.dart';
import 'components/gradient_textview.dart';

class About extends StatelessWidget {
  final _aboutData =
      "Hi, I am Devikiran Shetty PN from Karnataka. I hold a Master’s degree in Computer Applications from Nitte Mahalinga Adyantaya Memorial Institute of Technology (NMAMIT), Nitte, Karkala, Udupi. Presently, I am engaged as a Software Engineer at Global Delight Technology Private Limited in Udupi. With comprehensive exposure to the entire software development lifecycle, I have successfully contributed from initial requirement gathering to final product delivery. I thrive in dynamic, fast-paced environments working with small, focused teams, consistently delivering high-quality software solutions within tight deadlines. My approach emphasizes collaboration, leveraging agile and scrum methodologies to ensure efficient project execution without compromising on quality";

  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: defaultPadding,
        horizontal: 24,
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Responsive.isTablet(context)
              ? SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _aboutScreen(context),
                      const SizedBox(height: 32),
                      GradientDivider(),
                      const SizedBox(height: 32),
                      Experience(),
                    ],
                  ),
                )
              : SingleChildScrollView(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: _aboutScreen(context)),
                      const SizedBox(width: 32),
                      Expanded(child: Experience()),
                    ],
                  ),
                );
        },
      ),
    );
  }

  Widget _aboutScreen(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GradientTextView(text: "Devikiran Shetty P N", fontSize: 32),
        const SizedBox(height: 8),
        const Text(
          "Software Engineer",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.blue,
          ),
        ),
        const SizedBox(height: 32),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            _aboutData,
            style: const TextStyle(fontSize: 18, color: Colors.white70),
          ),
        ),
        const SizedBox(height: 28),
        _personalInfoSection(context),
        const SizedBox(height: 36),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 72),
          child: ResumeDownloadButton(),
        ),
      ],
    );
  }

  Widget _personalInfoSection(BuildContext context) {
    if (Responsive.isLargeMobile(context)) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _keyValueTextView(key: 'Age', value: '26'),
          const SizedBox(height: 16),
          _keyValueTextView(
            key: 'Email',
            value: 'devikiranshettypn4@gmail.com',
          ),
          const SizedBox(height: 16),
          _keyValueTextView(key: 'Phone', value: '(+91) - 9483057401'),
          const SizedBox(height: 16),
          _keyValueTextView(key: 'Place', value: 'Karnataka'),
        ],
      );
    } else {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _keyValueTextView(key: 'Age', value: '26'),
              const SizedBox(width: 16),
              _keyValueTextView(
                key: 'Email',
                value: 'devikiranshettypn4@gmail.com',
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _keyValueTextView(key: 'Phone', value: '(+91) - 9483057401'),
              const SizedBox(width: 16),
              _keyValueTextView(key: 'Place', value: 'Karnataka'),
            ],
          ),
        ],
      );
    }
  }

  Widget _keyValueTextView({required String key, required String value}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey.shade800,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        '$key: $value',
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    );
  }
}
