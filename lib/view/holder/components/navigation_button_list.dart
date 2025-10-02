import 'package:flutter/material.dart';
import '../../../view model/controller.dart';
import '../../../view model/responsive.dart';
import 'appbar_text_button.dart';

class NavigationButtonList extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onNavTap;

  const NavigationButtonList({super.key, required this.selectedIndex, required this.onNavTap});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final navButtons = [
      AppBarTextButton(
        onTap: () => onNavTap(0),
        text: 'Home',
        isSelected: selectedIndex == 0,
      ),
      if(Responsive.isTablet(context))  SizedBox(height: 18),
      AppBarTextButton(
        onTap: () => onNavTap(1),
        text: 'About',
        isSelected: selectedIndex == 1,
      ),
      if(Responsive.isTablet(context))  SizedBox(height: 18),
      AppBarTextButton(
        onTap: () => onNavTap(2),
        text: 'Skills',
        isSelected: selectedIndex == 2,
      ),
      if(Responsive.isTablet(context))  SizedBox(height: 18),
      AppBarTextButton(
        onTap: () => onNavTap(3),
        text: 'Education',
        isSelected: selectedIndex == 3,
      ),
      if(Responsive.isTablet(context))  SizedBox(height: 18),
      AppBarTextButton(
        onTap: () => onNavTap(4),
        text: 'Certification',
        isSelected: selectedIndex == 4,
      ),
      if(Responsive.isTablet(context))  SizedBox(height: 18),
      AppBarTextButton(
        onTap: () => onNavTap(5),
        text: 'Projects',
        isSelected: selectedIndex == 5,
      ),
    ];

    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 200),
      builder: (context, double value, child) {
        return Transform.scale(
          scale: value,
          child: Responsive.isTablet(context)
              ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: navButtons)
              : Row(mainAxisAlignment: MainAxisAlignment.center, children: navButtons),
        );
      },
    );
  }
}