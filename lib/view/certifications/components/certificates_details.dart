import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../model/certificate_model.dart';
import '../../../res/constants.dart';
import '../../../view model/getx_controllers/certification_controller.dart';
import '../../utils/image_viewer.dart';

class CertificateDetails extends StatelessWidget {
  final controller = Get.put(CertificationController());
  CertificateDetails({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (value) {
        controller.onHover(index, value);
      },
      onTap: () {
        ImageViewer(context, index);
      },
      borderRadius: BorderRadius.circular(30),
      child: AnimatedContainer(
          padding: const EdgeInsets.all(defaultPadding),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: bgColor),
          duration: const Duration(milliseconds: 500),
          child: Align(
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  certificateList[index].name,
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 26),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: defaultPadding,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      certificateList[index].organization,
                      style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold, fontSize: 24),),
                    Text(
                      certificateList[index].date,
                        style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 18)

                    ),
                  ],
                ),
                const SizedBox(height: defaultPadding/2,),
                Text.rich(
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  TextSpan(
                      text: 'Skills : ',style: const TextStyle(color: Colors.white, fontSize: 18),
                      children: [
                        TextSpan(
                          text: certificateList[index].skills,style: const TextStyle(color: Colors.grey,overflow: TextOverflow.ellipsis))
                      ]
                  ),),
                const SizedBox(height: defaultPadding,),



              ],
            ),
          )),
    );
  }
}