import 'package:api_demo/app/controller/main_controller.dart';
import 'package:api_demo/app/views/books/book_screen.dart';
import 'package:api_demo/app/views/favourites/favorite_scree.dart';

import 'package:api_demo/app/views/home/home_screen.dart';
import 'package:api_demo/app/views/favourites/fav_screen.dart';
import 'package:api_demo/app/views/search/search_screen.dart';

import 'package:api_demo/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
   final MovieController controller = Get.put(MovieController());
  List pages = [const HomeScreen(),  SearchScreen(), FavoriteMoviesScreen(),  ];

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
        body: Obx(() => pages[controller.currentIndex.value]),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
              
              backgroundColor: Colours.scaffoldBgColor,
              onTap: controller.onTap,
              currentIndex: controller.currentIndex.value,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.grey,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.search), label: "search"),
                    BottomNavigationBarItem(
                    icon: Icon(Icons.book), label: "books"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite), label: "favorite"),
              ]),
        ));
  }
}
