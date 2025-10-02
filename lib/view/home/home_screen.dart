import 'package:flutter/material.dart';
import '../../res/constants.dart';
import '../../view model/responsive.dart';
import '../utils/profile_image.dart';
import 'components/animated_user_skills.dart';
import 'components/resume_download_button.dart';
import 'components/social_media.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Container(
          child: Responsive.isTablet(context)
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ProfileImage(width: 250, height: 250),
                    SizedBox(height: 54),
                    _homeScreenContent(context),
                  ],
                )
              : Padding(
                  padding: const EdgeInsets.fromLTRB(96, 16, 96, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _homeScreenContent(context),
                      Spacer(),
                      ProfileImage(width: 250, height: 250),
                    ],
                  ),
                ),
        ),
      ),
    );
  }

  Widget _homeScreenContent(BuildContext context) {
    return Column(
      crossAxisAlignment: Responsive.isTablet(context)
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      mainAxisAlignment: Responsive.isTablet(context)
          ? MainAxisAlignment.center
          : MainAxisAlignment.start,
      children: [
        Text(
          "Hii There,",
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w900,
            height: 1,
            fontSize: 40,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 24),
        Text(
          "I'm Devikiran",
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w900,
            height: 1,
            fontSize: 40,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        AnimatedUserSkills(),
        const SizedBox(height: 24),
        const SocialMedia(),
        const SizedBox(height: 24),
        const ResumeDownloadButton(),
      ],
    );
  }
}
