import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../model/education_model.dart';
import '../../../res/constants.dart';
import '../../../view model/getx_controllers/qualification_controller.dart';
import 'education_details.dart';

class EducationList extends StatelessWidget {
  EducationList({super.key});

  final controller = Get.put(EducationController());

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      itemCount: educationList.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Obx(() => AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.symmetric(vertical: defaultPadding),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: const LinearGradient(colors: [
              Colors.pinkAccent,
              Colors.blue,
            ]),
            boxShadow: [
              BoxShadow(
                color: Colors.pink,
                offset: const Offset(-2, 0),
                blurRadius: controller.hovers[index] ? 20 : 10,
              ),
              BoxShadow(
                color: Colors.blue,
                offset: const Offset(2, 0),
                blurRadius: controller.hovers[index] ? 20 : 10,
              ),
            ],
          ),
          child: EducationDetail(index: index),
        ));
      },
    );
  }
}
