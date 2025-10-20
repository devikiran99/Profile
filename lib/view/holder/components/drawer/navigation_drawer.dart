import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../res/constants.dart';
import '../../../home/components/social_media.dart';
import '../footer_info.dart';
import '../navigation_button_list.dart';
import 'nav_drawer_profile.dart';

class NavDrawer extends StatelessWidget {

  final int selectedIndex;
  final ValueChanged<int> onNavTap;

  const NavDrawer({super.key, required this.selectedIndex, required this.onNavTap});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: bgColor,
      child: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: IntrinsicHeight(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const NavDrawerProfile(),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: NavigationButtonList(
                    selectedIndex:  selectedIndex,
                    onNavTap: (index) {
                      onNavTap(index);
                      Navigator.of(context).pop();
                    },
                  ),
                ),

                const Spacer(),
                const SizedBox(height: 24),

                Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialMediaIcon(
                          icon: 'assets/utils/linkedin.svg',
                          onTap: () => launchUrl(Uri.parse('https://www.linkedin.com/in/devikiran-shetty-6899a9191/'))),
                      const SizedBox(width: 40),
                      SocialMediaIcon(
                        icon: 'assets/utils/github.svg',
                        onTap: () => launchUrl(Uri.parse('https://github.com/devikiran99')),
                      ),
                    ],
                  ),
                ),
                const FooterInfo()
              ],
            ),
          ),
        ),
      ),
    );
  }
}






