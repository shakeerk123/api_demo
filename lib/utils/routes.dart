import 'package:api_demo/app/views/bottombar/main_page.dart';
import 'package:api_demo/app/views/home/home_screen.dart';
import 'package:api_demo/app/views/profile/profile.dart';
import 'package:api_demo/app/views/search/search_screen.dart';
import 'package:get/get.dart';


class AppRoutes {
  static final List<GetPage> routes = [
    GetPage(
      name: '/',
      page: () => const MainPage(),
     
    ),
  ];
}
