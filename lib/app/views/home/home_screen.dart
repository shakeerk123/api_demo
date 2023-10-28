// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api_demo/app/views/bottombar/main_page.dart';
import 'package:api_demo/widgets/home_widgets/movie_category_widget.dart';
import 'package:api_demo/widgets/home_widgets/container_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:api_demo/app/controller/mainController.dart';
import 'package:api_demo/widgets/home_widgets/popular_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(MainController());
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
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
                title: "Top Rated",
                fetchMovies: () => controller.topratedmovies,
                controller: controller),
            MoviesCategory(
                title: "Animated",
                fetchMovies: () => controller.animationMovies,
                controller: controller),
            const SizedBox(height: 10),
            ContainerWidget(
              controller: controller,
              title: 'UPCOMING',
              fetchMovies: () => controller.upComingmovies,
            ),
            const SizedBox(height: 10),
            MoviesCategory(
                title: "Malayalam",
                fetchMovies: () => controller.malayalamMovies,
                controller: controller),
            MoviesCategory(
                title: "Upcoming",
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
    );
  }
}
