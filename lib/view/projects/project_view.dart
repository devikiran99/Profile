import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../res/constants.dart';
import '../../view model/getx_controllers/projects_controller.dart';
import '../../view model/responsive.dart';
import '../holder/components/footer_info.dart';
import 'components/projects_grid.dart';

class ProjectsView extends StatelessWidget {
  ProjectsView({super.key});

  final controller = Get.put(ProjectController());

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: const Text(
                "Projects",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: defaultPadding),
            Responsive(
              desktop: ProjectGrid(ratio: 1.5, crossAxisCount: 2),
              extraLargeScreen: ProjectGrid(ratio: 1.6, crossAxisCount: 2),
              largeMobile: ProjectGrid(crossAxisCount: 1, ratio: 1.4),
              mobile: ProjectGrid(crossAxisCount: 1, ratio: 1.3),
              tablet: ProjectGrid(ratio: 1.1, crossAxisCount: 2),
            ),

            const SizedBox(height: defaultPadding),

            // Always include when this screen is your last screen in the page
            const FooterInfo()
          ],
      ),
    );
  }
}
