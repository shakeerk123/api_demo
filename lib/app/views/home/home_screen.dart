// ignore_for_file: public_member_api_docs, sort_constructors_firs
import 'package:api_demo/widgets/home_widgets/movie_category_widget.dart';
import 'package:api_demo/widgets/home_widgets/container_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:api_demo/app/controller/main_controller.dart';
import 'package:api_demo/widgets/home_widgets/popular_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(MovieController());
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.transparent,
        title: Image.asset("assets/cinemaven.png", height: 50),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            PopularMovieWidget(controller: controller),
            const SizedBox(height: 10),
            MoviesCategory(
                title: "Hindi Actions",
                fetchMovies: () => controller.hindiMovie,
                controller: controller),
            MoviesCategory(
                title: "Top Rated 🔥",
                fetchMovies: () => controller.topratedmovies,
                controller: controller),
            MoviesCategory(
                title: "Animated 🍫",
                fetchMovies: () => controller.animationMovies,
                controller: controller),
            const SizedBox(height: 10),
            ContainerWidget(
              controller: controller,
              title: 'UPCOMING 🍿',
              fetchMovies: () => controller.upComingmovies,
            ),
            const SizedBox(height: 10),
            MoviesCategory(
                title: "Malayalam ❄️",
                fetchMovies: () => controller.malayalamMovies,
                controller: controller),
            MoviesCategory(
                title: "Upcoming ",
                fetchMovies: () => controller.upComingmovies,
                controller: controller),
            const SizedBox(height: 10),
            ContainerWidget(
                title: "TAMIL HITS",
                fetchMovies: () => controller.tamilMovie,
                controller: controller),
            const SizedBox(height: 10),
            MoviesCategory(
                title: "Now Playing",
                fetchMovies: () => controller.nowPlayingmovies,
                controller: controller),
            MoviesCategory(
                title: "Tamil Movies",
                fetchMovies: () => controller.tamilMovie,
                controller: controller),
          ],
        ),
      ),
      endDrawer: Drawer(
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text("John Doe"), // Replace with user's name
              accountEmail:
                  Text("johndoe@example.com"), // Replace with user's email
              currentAccountPicture: CircleAvatar(
                // Replace with user's profile picture
                backgroundImage: NetworkImage(
                  "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d8/Person_icon_BLACK-01.svg/1924px-Person_icon_BLACK-01.svg.png",
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text("Settings"),
              onTap: () {
                // Navigate to the Settings page
                //     Get.to(() => SettingsScreen());
              },
            ),
            ListTile(
              leading: const Icon(Icons.favorite),
              title: const Text("Favorites"),
              onTap: () {},
            ),
            // Add more drawer items as needed
          ],
        ),
      ),
    );
  }
}
