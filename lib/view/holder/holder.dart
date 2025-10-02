import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../view model/controller.dart';
import '../../view model/responsive.dart';
import '../about/about.dart';
import '../certifications/certifications.dart';
import '../education/education.dart';
import '../home/home_screen.dart';
import '../projects/project_view.dart';
import '../skill/skills.dart';
import '../utils/gradient_divider.dart';
import 'components/appbar_text_button.dart';
import 'components/drawer/navigation_drawer.dart';
import 'components/navigation_button_list.dart';

class Holder extends StatefulWidget {
  const Holder({super.key});

  @override
  State<Holder> createState() => _HolderState();
}

class _HolderState extends State<Holder> {

  final List<Widget> _pages = [
    const HomeScreen(),
    const About(),
    Skills(),
    Education(),
    Certifications(),
    ProjectsView()
  ];

  int _selectedIndex = 0;
  bool _innerScrollAtBottom = false;
  bool _innerScrollAtTop = true;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      int page = controller.page?.round() ?? 0;
      if (page != _selectedIndex) {
        setState(() {
          _selectedIndex = page;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: Responsive.isMobile(context) ? -10 : 0,
        title: AppBarContent(selectedIndex: _selectedIndex, onNavTap: _navigate),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(
          size: 32,
          color: Colors.white,
        ),
      ),
      drawer: Responsive.isTablet(context) ? const NavDrawer() : null,
      body: Column(
        children: [
          GradientDivider(gradientColor: [Colors.grey.shade200, Colors.grey.shade500, Colors.grey.shade600], height: 1),

          Expanded(
            child: NotificationListener<ScrollNotification>(
              onNotification: _handleScrollNotification,
              child: PageView(
                controller: controller,
                scrollDirection: Axis.vertical,
                physics: const ClampingScrollPhysics(),
                children: _pages,
              ),
            ),
          ),
        ],
      ),
    );
  }


  void _navigate(int index) {
    controller.animateToPage(index, duration: const Duration(milliseconds: 300), curve: Curves.easeInOutCubic);
    setState(() {
      _selectedIndex = index;
    });
  }

  bool _handleScrollNotification(ScrollNotification notification) {
    if (notification.metrics.axisDirection == AxisDirection.down) {
      // Check if inner scroll is at bottom
      _innerScrollAtBottom = notification.metrics.pixels >= notification.metrics.maxScrollExtent;
      _innerScrollAtTop = notification.metrics.pixels <= notification.metrics.minScrollExtent;
    }

    if (notification is UserScrollNotification && notification.direction != ScrollDirection.idle) {
      if (_innerScrollAtBottom && notification.direction == ScrollDirection.reverse) {
        // User scrolls up beyond inner bottom: scroll page down
        if (_selectedIndex < _pages.length - 1) {
          controller.nextPage(duration: Duration(milliseconds: Responsive.isDesktop(context) ? 200 : 1500), curve: Curves.easeInOutCubic,);
          return true;
        }
      }
      if (_innerScrollAtTop && notification.direction == ScrollDirection.forward) {
        // User scrolls down beyond inner top: scroll page up
        if (_selectedIndex > 0) {
          controller.previousPage(duration: Duration(milliseconds: Responsive.isDesktop(context) ? 200 : 1500), curve: Curves.easeInOutCubic);
          return true;
        }
      }
    }
    return false;
  }
}

class AppBarContent extends StatelessWidget {
  static const gradientColors = [Colors.pink, Colors.blue];
  final int selectedIndex;
  final ValueChanged<int> onNavTap;

  const AppBarContent({
    super.key,
    required this.selectedIndex,
    required this.onNavTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppBarTextButton(
            gradientColors: gradientColors,
            fontSize: 32,
            text: 'Devikiran',
            onTap: () {
              launchUrl(Uri.parse('https://www.linkedin.com/in/devikiran-shetty-6899a9191/'));
            },
          ),
          const Spacer(),
          if (Responsive.isDesktop(context)) NavigationButtonList(selectedIndex: selectedIndex, onNavTap: onNavTap),
        ],
      ),
    );
  }
}








