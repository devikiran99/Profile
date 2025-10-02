import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../res/constants.dart';
import '../../view model/getx_controllers/qualification_controller.dart';
import '../../view model/responsive.dart';
import 'components/education_list.dart';

class Education extends StatelessWidget {
  final controller = Get.put(EducationController());
  Education({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: const Text(
              "My Education",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 32),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(
            height: defaultPadding,
          ),
          EducationList(),
        ],
      ),
    );
  }
}











