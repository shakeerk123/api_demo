import 'package:api_demo/app/views/bottombar/main_page.dart';
import 'package:api_demo/app/views/login/login_screen.dart';
import 'package:api_demo/app/views/onboarding/onboarding.dart';
import 'package:api_demo/app/views/signup/signup_screen.dart';
import 'package:api_demo/utils/colors.dart';
import 'package:api_demo/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
     // initialRoute: "/",
     // getPages: AppRoutes.routes,
      debugShowCheckedModeBanner: false,
      title: 'Cinemaven',
      home: SignupScreen(),
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colours.scaffoldBgColor,
        useMaterial3: true,
        
      ),
    );
  }
}
