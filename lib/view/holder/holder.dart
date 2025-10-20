import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
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

  final ScrollController _scrollController = ScrollController();

  final List<GlobalKey> _sectionKeys = List.generate(6, (_) => GlobalKey());
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const About(),
    Skills(),
    Education(),
    Certifications(),
    ProjectsView(),
  ];

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_updateSelectedSection);
    WidgetsBinding.instance.addPostFrameCallback((_) => _updateSelectedSection());
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToSection(int index) {
    final ctx = _sectionKeys[index].currentContext;
    if (ctx != null) {
      final box = ctx.findRenderObject() as RenderBox;

      // Get AppBar height
      final appBarHeight = kToolbarHeight;

      // Offset of section relative to scrollable content
      final offset = box.localToGlobal(Offset.zero, ancestor: null).dy +
          _scrollController.offset -
          appBarHeight;

      _scrollController.animateTo(
        offset,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOutCubic,
      );

      setState(() => _selectedIndex = index);
    }
  }


  void _updateSelectedSection() {
    if (!mounted) return;

    final screenHeight = MediaQuery.of(context).size.height;
    int newIndex = _selectedIndex;

    for (int i = 0; i < _sectionKeys.length; i++) {
      final ctx = _sectionKeys[i].currentContext;
      if (ctx == null) continue;

      final box = ctx.findRenderObject() as RenderBox;
      final pos = box.localToGlobal(Offset.zero).dy;

      if (pos <= screenHeight * 0.3 && pos + box.size.height > screenHeight * 0.3) {
        newIndex = i;
        break;
      }
    }

    if (newIndex != _selectedIndex) {
      setState(() => _selectedIndex = newIndex);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: Responsive.isMobile(context) ? -10 : 0,
        title: AppBarContent(
          selectedIndex: _selectedIndex,
          onNavTap: _scrollToSection,
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(size: 32, color: Colors.white),
      ),
      drawer: Responsive.isTablet(context) ? NavDrawer(
        selectedIndex: _selectedIndex,
        onNavTap: _scrollToSection
      ) : null,
      body: Column(
        children: [
          GradientDivider(
            gradientColor: [
              Colors.grey.shade200,
              Colors.grey.shade500,
              Colors.grey.shade600,
            ],
            height: 1,
          ),
          Expanded(
            child: Scrollbar(
              controller: _scrollController,
              thickness: Responsive.isDesktop(context) ? 8 : 0,
              radius: const Radius.circular(10),
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  children: [
                    for (int i = 0; i < _pages.length; i++)
                      ConstrainedBox(
                        key: _sectionKeys[i],
                        constraints: BoxConstraints(
                          minHeight: MediaQuery.of(context).size.height,
                        ),
                        child: _pages[i],
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
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
              launchUrl(Uri.parse(
                  'https://www.linkedin.com/in/devikiran-shetty-6899a9191/'));
            },
          ),
          const Spacer(),
          if (Responsive.isDesktop(context))
            NavigationButtonList(
              selectedIndex: selectedIndex,
              onNavTap: onNavTap,
            ),
        ],
      ),
    );
  }
}
