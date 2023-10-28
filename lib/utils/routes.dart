import 'package:api_demo/app/views/bottombar/main_page.dart';
import 'package:get/get.dart';


class AppRoutes {
  static final List<GetPage> routes = [
    GetPage(
      name: '/',
      page: () => const MainPage(),
     
    ),
  ];
}
