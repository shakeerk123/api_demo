import 'package:api_demo/app/controller/main_controller.dart';
import 'package:api_demo/app/models/movie_model.dart';
import 'package:api_demo/app/views/details/details_screen.dart';
import 'package:api_demo/utils/api_const.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:shimmer/shimmer.dart';
import 'package:transparent_image/transparent_image.dart';

class PopularMovieWidget extends StatelessWidget {
  const PopularMovieWidget({
    super.key,
    required this.controller,
  });

  final MovieController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: CarouselSlider.builder(
            itemCount: 20,
            options: CarouselOptions(autoPlay: true, enlargeCenterPage: true),
            itemBuilder: (context, index, pageViewIndex) {
              return FutureBuilder(
                future: controller.popularmovies,
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.hasData) {
                    MovieDataModel? data = snapshot.data as MovieDataModel?;
                    List<Result> results = data?.results ?? [];
                    String poster = results[index].backdropPath;
                    String title = results[index].title;
                    String text = title;
                    List<String> words = text.split(' ');
                    String titleMain = words.take(3).join(' ');
                    // ignore: unnecessary_null_comparison
                    if (poster == null || poster.isEmpty) {
                      return const SizedBox.shrink();
                    }

                    return GestureDetector(
                        onTap: () {
                          Get.to(() => DetailsScreen(movie: results[index]));
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Stack(
                            children: [
                              SizedBox(
                                height: 400,
                                width: MediaQuery.of(context).size.width,
                                child: FadeInImage.memoryNetwork(
                                  image: "$imagePath$poster",
                                  placeholder: kTransparentImage,
                                  fit: BoxFit.cover, // Set the fit to cover
                                ),
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [Colors.black, Colors.transparent],
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 130),
                                child: Center(
                                  child: Shimmer.fromColors(
                                    baseColor: Colors.white,
                                    highlightColor: Colors.grey,
                                    child: Text(titleMain,
                                        maxLines: 1,
                                        style: GoogleFonts.metalMania(
                                            fontSize: 30,
                                            fontWeight: FontWeight.w900)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ));
                  } else {
                    return const Center(
                      child: SizedBox(
                          width: 40,
                          child: LoadingIndicator(
                            indicatorType: Indicator.ballPulse,
                            colors: [Colors.white, Colors.blue],
                          )),
                    );
                  }
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
