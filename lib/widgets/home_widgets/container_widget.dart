import 'package:api_demo/app/controller/mainController.dart';
import 'package:api_demo/app/models/popularModel.dart';
import 'package:api_demo/app/views/details/details_screen.dart';
import 'package:api_demo/utils/api_const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:transparent_image/transparent_image.dart';

class ContainerWidget extends StatelessWidget {
  final String title;

  final Future<MovieDataModel> Function() fetchMovies;
  final MainController controller;

  const ContainerWidget({
    Key? key,
    required this.title,
    required this.fetchMovies,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchMovies(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasData) {
          MovieDataModel? data = snapshot.data as MovieDataModel?;
          List<Result> results = data?.results ?? [];
          String poster = results[4].backdropPath;
          // ignore: unnecessary_null_comparison
          if (poster == null || poster.isEmpty) {
            return const SizedBox.shrink();
          }

          return Stack(
            children: [
              GestureDetector(
                onTap: () {
                  Get.to(() => DetailsScreen(movie: results[4]));
                },
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  child: FadeInImage.memoryNetwork(
                    image: "$imagePath$poster",
                    placeholder: kTransparentImage,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 10,
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
                        child: Text(
                          title,
                          style: const TextStyle(
                              fontSize: 7, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        } else {
          return Shimmer.fromColors(
            baseColor: Colors.white,
            highlightColor: Colors.grey,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 200,
            ),
          );
        }
      },
    );
  }
}
