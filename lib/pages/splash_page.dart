import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_research/configs/app_icons.dart';
import 'package:project_research/pages/enter_info_page.dart';
import 'package:project_research/styles/app_colors.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Center(child: SvgPicture.asset(AppIcons.ic_logo)),
      nextScreen: const EnterInfoPage(),
      backgroundColor: AppColors.white,
    );
  }
}
