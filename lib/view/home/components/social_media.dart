import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../res/constants.dart';
import '../../../view model/responsive.dart';

class SocialMedia extends StatelessWidget {
  const SocialMedia({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: Responsive.isMobile(context) ? MainAxisAlignment.center : MainAxisAlignment.start,
      children: [
        SocialMediaIcon(icon: 'assets/utils/linkedin.svg',onTap: ()=>launchUrl(Uri.parse('https://www.linkedin.com/in/devikiran-shetty-6899a9191/'))),
        const SizedBox(width: 24),
        SocialMediaIcon(icon: 'assets/utils/github.svg',onTap: () => launchUrl(Uri.parse('https://github.com/devikiran99')),),
      ],
    );
  }
}

class SocialMediaIcon extends StatelessWidget {
  const SocialMediaIcon({super.key, required this.icon,  this.onTap});
  final String icon;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap,
      borderRadius: BorderRadius.circular(20),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: defaultPadding * 0.4),
        child: SvgPicture.asset(icon,color: Colors.white,height: 32,width: 32,),
      ),
    );
  }
}
