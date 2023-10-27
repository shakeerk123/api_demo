import 'dart:ui';
import 'package:api_demo/app/controller/fav_controller.dart';
import 'package:api_demo/app/controller/mainController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:api_demo/app/models/popularModel.dart';
import 'package:api_demo/utils/api_const.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final Result movie;

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(FavoriteController());

    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage('$imagePath${movie.posterPath}'),
                  fit: BoxFit.cover,
                ),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.2),
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back_ios),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 20, right: 20),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: SizedBox(
                          width: double.infinity,
                          height: 400,
                          child: (movie.posterPath.isNotEmpty)
                              ? Image.network(
                                  '$imagePath${movie.posterPath}',
                                  fit: BoxFit.cover,
                                )
                              : const Center(
                                  child: Text("No Image Available"),
                                ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          movie.title,
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                          maxLines: 2,
                        ),
                        IconButton(
                          onPressed: () {
                            controller.toggleFavorite(movie);
                            
                          },
                          icon: Obx(() => Icon(
                                controller.favoriteMovies.contains(movie)
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: Colors.red,
                                size: 30,
                              )),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      movie.overview,
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Text(
                          "Rating ",
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Icon(Icons.star, color: Colors.amber),
                        Text(" ${movie.voteAverage.toStringAsFixed(1)} / 10"),
                      ],
                    ),
                    Text(
                      "Released on : ${movie.releaseDate.year}",
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 20),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: (movie.backdropPath.isNotEmpty)
                          ? SizedBox(
                              height: 200,
                              child: Image.network(
                                  "$imagePath${movie.backdropPath}"),
                            )
                          : const Center(
                              child: Text("No Image Available"),
                            ), // Show a placeholder if image not found
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
