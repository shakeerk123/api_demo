import 'package:api_demo/app/controller/mainController.dart';
import 'package:api_demo/app/views/home/home_screen.dart';
import 'package:api_demo/app/views/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages =[
    const HomeScreen(),
    const ProfilePage(),
    const ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    final MainController controller = Get.put(MainController());
    return Scaffold(
      body: Obx(() => pages[controller.currentIndex.value]),
      bottomNavigationBar:Obx(() =>  BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        backgroundColor: Colors.red,
        onTap: controller.onTap,
        currentIndex: controller.currentIndex.value,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        
        
        items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.search),label: "search"),
        BottomNavigationBarItem(icon: Icon(Icons.person),label: "profile"),
      ]),
    ));
  }
}