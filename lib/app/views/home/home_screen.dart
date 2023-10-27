// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api_demo/app/views/search/search_screen.dart';
import 'package:api_demo/widgets/home_widgets/animationmovies.dart';
import 'package:api_demo/widgets/home_widgets/container_widget.dart';
import 'package:api_demo/widgets/home_widgets/malayalam.dart';
import 'package:api_demo/widgets/home_widgets/tamilconatiner.dart';
import 'package:api_demo/widgets/home_widgets/tamilmovie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:api_demo/app/controller/mainController.dart';
import 'package:api_demo/widgets/home_widgets/now_playing.dart';
import 'package:api_demo/widgets/home_widgets/popular_widget.dart';
import 'package:api_demo/widgets/home_widgets/toprated.dart';
import 'package:api_demo/widgets/home_widgets/upcoming.dart';

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
        actions: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: IconButton(
              onPressed: () {
                Get.to(SearchScreen());
              },
              icon: const Icon(Icons.search),
            ),
          )
        ],
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
            TopRatedMoviesWidget(controller: controller),
            AnimatedMovies(controller: controller),
            const SizedBox(height: 10),
            UpcomingContainerWidget(controller: controller),
            const SizedBox(height: 10),
            MalayalamMovies(controller: controller),
            UpcomingMoviesWidget(controller: controller),
            const SizedBox(height: 10),
            TamilContainerWidget(controller: controller),
            const SizedBox(height: 10),
            NowPlayingMoviesWidget(controller: controller),
            TamilMovie(controller: controller)
          ],
        ),
      ),
    );
  }
}
