import 'package:api_demo/app/views/bottombar/main_page.dart';
import 'package:api_demo/app/views/login/login_screen.dart';
import 'package:api_demo/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  //WidgetsFlutterBinding.ensureInitialized();
 // await Firebase.initializeApp();
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
      home: const MainPage(),
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colours.scaffoldBgColor,
        useMaterial3: true,
        
      ),
    );
  }
}
