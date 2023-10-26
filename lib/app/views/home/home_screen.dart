// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api_demo/widgets/home_widgets/animationmovies.dart';
import 'package:api_demo/widgets/home_widgets/container_widget.dart';
import 'package:api_demo/widgets/home_widgets/malayalam.dart';
import 'package:api_demo/widgets/home_widgets/tamilconatiner.dart';
import 'package:api_demo/widgets/home_widgets/tamilmovie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

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
        actions: const [
          Padding(
            padding: EdgeInsets.all(12.0),
            child: Icon(Icons.search),
          )
        ],
        title: Shimmer.fromColors(
          period: const Duration(milliseconds: 4000),
          baseColor: Colors.grey,
          highlightColor: Colors.white,
          child: Image.asset("assets/cinemaven.png", height: 50),
        ),
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
            
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text("Top Rated 🔥🔥 ",
                    style: GoogleFonts.kanit(fontSize: 20))),
            TopRatedMoviesWidget(controller: controller),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text("Animated movies 🍿 ",
                    style: GoogleFonts.kanit(fontSize: 20))),
            AnimatedMovies(controller: controller),
            const SizedBox(height: 10),
            UpcomingContainerWidget(controller: controller),
            const SizedBox(height: 10),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text("Malayalam movies 👨‍👩‍👧‍👦",
                    style: GoogleFonts.kanit(fontSize: 20))),
            
            MalayalamMovies(controller: controller),
            
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text("Upcoming Movies 📅 ",
                    style: GoogleFonts.kanit(fontSize: 20))),
           
            UpcomingMoviesWidget(controller: controller),
            const SizedBox(height: 10),
            TamilContainerWidget(controller: controller),
            const SizedBox(height: 10),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text("Now Playing 🌟",
                    style: GoogleFonts.kanit(fontSize: 20))),
           
            NowPlayingMoviesWidget(controller: controller),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text("Tamil Shows  🔥🔥 ",
                    style: GoogleFonts.kanit(fontSize: 20))),
                    TamilMovie(controller: controller)
            
          ],
        ),
      ),
    );
  }
}
