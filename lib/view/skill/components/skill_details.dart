import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../model/skill_model.dart';
import '../../../res/constants.dart';
import '../../../view model/getx_controllers/skill_controller.dart';

class SkillDetail extends StatelessWidget {
  final controller = Get.put(SkillController());
  SkillDetail({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (value) {
        controller.onHover(index, value);
      },
      onTap: () {
      },
      borderRadius: BorderRadius.circular(30),
      child: AnimatedContainer(
          padding: const EdgeInsets.all(defaultPadding),
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: bgColor),
          duration: const Duration(milliseconds: 500),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              if(skillList[index].srcPath.isNotEmpty)
                SvgPicture.asset(skillList[index].srcPath, height: 54,width: 54),

              SizedBox(height: 16),

              Text(
                textAlign: TextAlign.center,
                skillList[index].name,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              )
            ],
          )),
    );
  }
}