import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../model/certificate_model.dart';
import '../../../res/constants.dart';
import '../../../view model/getx_controllers/certification_controller.dart';
import '../../utils/image_viewer.dart';

class CertificateDetails extends StatelessWidget {
  final controller = Get.put(CertificationController());
  final int index;

  CertificateDetails({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (value) => controller.onHover(index, value),
      onTap: () => ImageViewer(context, index),
      borderRadius: BorderRadius.circular(30),
      child: Obx(() {
        final isHovering = controller.hovers[index];

        return Stack(
          children: [
            // === Original card content ===
            AnimatedContainer(
              padding: const EdgeInsets.all(defaultPadding),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: bgColor,
              ),
              duration: const Duration(milliseconds: 300),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    certificateList[index].name,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 26),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: defaultPadding),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        certificateList[index].organization,
                        style: const TextStyle(
                            color: Colors.amber,
                            fontWeight: FontWeight.bold,
                            fontSize: 24),
                      ),
                      Text(
                        certificateList[index].date,
                        style: const TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ],
                  ),
                  const SizedBox(height: defaultPadding / 2),
                  Text.rich(
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    TextSpan(
                      text: 'Skills: ',
                      style:
                      const TextStyle(color: Colors.white, fontSize: 18),
                      children: [
                        TextSpan(
                          text: certificateList[index].skills,
                          style: const TextStyle(
                              color: Colors.grey,
                              overflow: TextOverflow.ellipsis),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: defaultPadding),
                ],
              ),
            ),

            // === Hover overlay ===
            Positioned.fill(
              child: IgnorePointer(
                ignoring: !isHovering,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 200),
                  opacity: isHovering ? 1.0 : 0.0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: TextButton.icon(
                        onPressed: () => ImageViewer(context, index),
                        icon: const Icon(Icons.remove_red_eye,
                            color: Colors.white70, size: 28),
                        label: const Text(
                          "View Certificate",
                          style: TextStyle(
                              color: Colors.white70,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 16),
                          backgroundColor: Colors.pink.shade400,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
