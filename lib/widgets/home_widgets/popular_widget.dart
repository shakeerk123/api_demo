import 'package:api_demo/app/controller/mainController.dart';
import 'package:api_demo/app/models/popularModel.dart';
import 'package:api_demo/app/views/details/details_screen.dart';
import 'package:api_demo/utils/api_const.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:shimmer/shimmer.dart';

class PopularMovieWidget extends StatelessWidget {
  const PopularMovieWidget({
    super.key,
    required this.controller,
  });

  final MainController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CarouselSlider.builder(
        itemCount: 20,
        options: CarouselOptions(autoPlay: true, enlargeCenterPage: true),
        itemBuilder: (context, index, pageViewIndex) {
          return FutureBuilder(
            future: controller.popularmovies,
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasData) {
                MovieDataModel? data = snapshot.data as MovieDataModel?;
                List<Result> results = data?.results ?? [];
                String poster = results[index].posterPath;

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DetailsScreen(movie: results[index]),
                      ),
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Stack(
                      children: [
                        SizedBox(
                          height: 400,
                          width: MediaQuery.of(context).size.width * 0.75,
                          child: Image.network(
                            "$imagePath$poster",
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          top: 8,
                          left: 8,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: Container(
                              width: 50,
                              height: 18,
                              color: const Color.fromARGB(255, 8, 129, 228),
                              child: Center(
                                child: Shimmer.fromColors(
                                  baseColor: Colors.white,
                                  highlightColor: Colors.grey,
                                  child: const Text(
                                    "POPULAR",
                                    style: TextStyle(
                                        fontSize: 7,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
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
    );
  }
}
