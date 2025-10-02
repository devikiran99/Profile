import 'package:flutter/material.dart';
import 'package:profile/view/projects/components/project_link.dart';
import '../../../model/project_model.dart';
import '../../../view model/responsive.dart';

class ProjectDetail extends StatelessWidget {
  final int index;
  const ProjectDetail({super.key, required this.index});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(alignment: Alignment.topCenter,child: Text(
          projectList[index].name,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold),
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),),
        SizedBox(height: Responsive.isDesktop(context) ? 32 : 12),
        Text(projectList[index].description,style: const TextStyle(color: Colors.grey,height: 1.5),maxLines: Responsive.isMobile(context) ? 2 : Responsive.isLargeMobile(context)? 3 : 4 ,overflow: TextOverflow.ellipsis),
        SizedBox(height: Responsive.isDesktop(context) ? 24 : 8),
        Align(alignment: Alignment.topCenter, child: Text(projectList[index].terms,style: const TextStyle(color: Colors.red, fontSize: 10), maxLines: 2 ,overflow: TextOverflow.ellipsis)),
        SizedBox(height: Responsive.isDesktop(context) ? 24 : 8),
        ProjectLinks(index: index,),
        SizedBox(height: Responsive.isDesktop(context) ? 24 : 8),
      ],
    );
  }
}
