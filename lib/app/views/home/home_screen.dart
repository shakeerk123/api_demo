import 'package:api_demo/app/controller/mainController.dart';
import 'package:api_demo/app/models/popularModel.dart';
import 'package:api_demo/utils/api_const.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_indicator/loading_indicator.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(MainController());
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Icon(Icons.search),
          )
        ],
        title: Image.asset(
          "assets/cinemaven.png",
          height: 50,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text("Popular Movies" ,style: GoogleFonts.kanit(fontSize: 20),),
            ),
            SizedBox(height: 20,),
            SizedBox(
              width: double.infinity,
              child: CarouselSlider.builder(
                itemCount: 6,
                options:
                    CarouselOptions(autoPlay: true, enlargeCenterPage: true),
                itemBuilder: (context, index, pageViewIndex) {
                  return FutureBuilder(
                    future: controller.popularmovies,
                    builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshot) {
                      if (snapshot.hasData) {
                        MovieDataModel? data = snapshot.data as MovieDataModel?;
                        List<Result> results = data?.results ?? [];
                        String poster = results[index].posterPath;
                      
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Container(
                            height: 400,
                            width: MediaQuery.of(context).size.width * 0.75,
                            child: Image.network(
                              "$imagePath$poster",
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      } else {
                        return Center(
                          child: SizedBox(width: 40,
                            child: LoadingIndicator(indicatorType: Indicator.ballPulse,colors: [Colors.white,Colors.blue],)),
                        );
                      }
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
