import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../res/constants.dart';
import '../../view model/getx_controllers/skill_controller.dart';
import '../../view model/responsive.dart';
import 'components/skill_grid.dart';

class Skills extends StatelessWidget {
  final controller = Get.put(SkillController());
  Skills({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Align(
            alignment: Alignment.center,
            child: Text(
              "Skills & Abilities",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 32),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(height: defaultPadding),
          Responsive(
            desktop: SkillGrid(crossAxisCount: 4, ratio: 1.5),
            extraLargeScreen: SkillGrid(crossAxisCount: 4, ratio: 1.6),
            largeMobile: SkillGrid(crossAxisCount: 1, ratio: 1.8),
            mobile: SkillGrid(crossAxisCount: 2, ratio: 0.7),
            tablet: SkillGrid(crossAxisCount: 3, ratio: 1.4),
          ),
        ],
      ),
    );
  }
}










