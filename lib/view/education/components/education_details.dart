import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../model/certificate_model.dart';
import '../../../model/education_model.dart';
import '../../../model/skill_model.dart';
import '../../../res/constants.dart';
import '../../../view model/getx_controllers/certification_controller.dart';
import '../../../view model/getx_controllers/qualification_controller.dart';
import '../../../view model/responsive.dart';

class EducationDetail extends StatelessWidget {
  final EducationController controller = Get.put(EducationController());
  final int index;

  EducationDetail({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (value) {
        controller.onHover(index, value);
      },
      onTap: () {},
      borderRadius: BorderRadius.circular(30),
      child: AnimatedContainer(
        padding: const EdgeInsets.all(defaultPadding),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: bgColor),
        duration: const Duration(milliseconds: 500),
        child: _educationContent(),
      ),
    );
  }

  Widget _educationContent() {
    final education = educationList[index];
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(13),
          child: Image.asset(
            education.imgSrc,
            width: 80,
            height: 80,
            fit: BoxFit.fill,
          ),
        ),

        const SizedBox(width: 16),

        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                education.name,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 26),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
              Text(
                education.institutionName,
                style: const TextStyle(
                    color: Colors.white60,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 6),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: education.score,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.green.shade800,
                        fontWeight: FontWeight.bold,
                        height: 1.0,
                      ),
                    ),
                    const TextSpan(
                      text: ' | ',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        height: 1.0,
                      ),
                    ),
                    TextSpan(
                      text: education.duration,
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.green.shade800,
                        fontWeight: FontWeight.bold,
                        height: 1.0,
                      ),
                    ),
                  ],
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
        ),
      ],
    );
  }
}
