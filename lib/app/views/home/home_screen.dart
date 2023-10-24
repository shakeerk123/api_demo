import 'package:api_demo/app/controller/mainController.dart';
import 'package:api_demo/widgets/home_widgets/now_playing.dart';
import 'package:api_demo/widgets/home_widgets/popular_widget.dart';
import 'package:api_demo/widgets/home_widgets/toprated.dart';
import 'package:api_demo/widgets/home_widgets/upcoming.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';


class HomeScreen extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const HomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(MainController());
    return Scaffold(
      appBar: AppBar(
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
        physics:const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            PopularMovieWidget(controller: controller),
            const SizedBox(height: 20),
            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:8.0),
              child: Text("Top Rated !!! ",style: GoogleFonts.kanit(fontSize: 20),),
            ),
        
            const SizedBox(height: 10),
            TopRatedMoviesWidget(controller: controller),
            const SizedBox(height: 20),
            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:8.0),
              child: Text("UpComing !!! ",style: GoogleFonts.kanit(fontSize: 20),),
            ),
        
            const SizedBox(height: 10),
            UpcomingMoviesWidget(controller: controller),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:8.0),
              child: Text("Now Playing ",style: GoogleFonts.kanit(fontSize: 20),),
            ),
        
            const SizedBox(height: 10),
            NowPlayingMoviesWidget(controller: controller)
          ],
        ),
      ),
    );
  }
}
