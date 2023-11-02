import 'package:api_demo/app/views/bottombar/main_page.dart';
import 'package:api_demo/utils/colors.dart';
import 'package:api_demo/utils/text_conts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intro_screen_onboarding_flutter/intro_app.dart';

class OnBoardingScreen extends StatelessWidget {
  final List<Introduction> list = [
    Introduction(
        subTitleTextStyle: GoogleFonts.poppins(fontSize: 15),
        titleTextStyle: GoogleFonts.raleway(fontSize: 20,fontWeight: FontWeight.bold),
        imageUrl: 'assets/movie1.png',
        title: TextConstants.onBoarding1,
        subTitle: TextConstants.onBoardingmsg1),
    Introduction(
        subTitleTextStyle: GoogleFonts.poppins(fontSize: 15),
        titleTextStyle: GoogleFonts.raleway(fontSize: 20,fontWeight: FontWeight.bold),
        imageUrl: 'assets/movie2.png',
        title: TextConstants.onBoarding2,
        subTitle: TextConstants.onBoardingmsg2),
    Introduction(
        subTitleTextStyle: GoogleFonts.poppins(fontSize: 15),
        titleTextStyle: GoogleFonts.raleway(fontSize: 20,fontWeight: FontWeight.bold),
        imageUrl: 'assets/movie3.png',
        title: TextConstants.onBoarding3,
        subTitle: TextConstants.onBoardingmsg3), 
  ];

  OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return IntroScreenOnboarding(skipTextStyle:  GoogleFonts.poppins(fontSize: 15),
      backgroudColor: Colours.scaffoldBgColor,
      foregroundColor: Colors.blue,
      introductionList: list,
      onTapSkipButton: () {
        Get.to(const MainPage());
      },
    );
  }
}
