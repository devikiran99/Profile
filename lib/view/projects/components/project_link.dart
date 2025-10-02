import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../model/project_model.dart';

class ProjectLinks extends StatelessWidget {
  final int index;
  const ProjectLinks({super.key, required this.index});

  @override
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.sizeOf(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8), // less side padding
      child: InkWell(
        onTap: () {
          launchUrl(Uri.parse(projectList[index].link));
        },
        child: Container(
          height: size.width>700 ? 48  : 40 ,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: LinearGradient(colors: [
              Colors.pink,
              Colors.blue.shade900,
            ]),
            boxShadow: const [
              BoxShadow(color: Colors.blue, offset: Offset(0, -1), blurRadius: 5),
              BoxShadow(color: Colors.red, offset: Offset(0, 1), blurRadius: 5),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(projectList[index].linkImage, height: 28,width: 28, fit: BoxFit.fill),
              const SizedBox(width: 8),
              Flexible(
                child: Text(
                  projectList[index].linkName,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          )
          ,
        ),
      ),
    );
  }
}
