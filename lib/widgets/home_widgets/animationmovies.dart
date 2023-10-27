import 'package:api_demo/app/controller/mainController.dart';
import 'package:api_demo/app/models/popularModel.dart';
import 'package:api_demo/app/views/details/details_screen.dart';
import 'package:api_demo/utils/api_const.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:transparent_image/transparent_image.dart';

class AnimatedMovies extends StatelessWidget {
  const AnimatedMovies({
    super.key,
    required this.controller,
  });

  final MainController controller;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.animationMovies,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasData) {
          MovieDataModel? data = snapshot.data as MovieDataModel?;
          List<Result> results = data?.results ?? [];

          return Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text("Animated movies 🍿 ",
                    style: GoogleFonts.kanit(fontSize: 20))),
              SizedBox(
                height: 200,
                width: double.infinity,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
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
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: SizedBox(
                            width: 120,
                            child: FadeInImage.memoryNetwork(
                              image: "$imagePath$poster",
                              placeholder: kTransparentImage,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        } else {
          return Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: SizedBox(
              width: double.infinity,
              height: 200,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(10)),
                      width: 120,
                    ),
                  );
                },
              ),
            ),
          );
        }
      },
    );
  }
}
