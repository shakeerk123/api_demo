import 'dart:ui';
import 'package:api_demo/app/controller/fav_controller.dart';
import 'package:api_demo/app/controller/main_controller.dart';
import 'package:api_demo/utils/colors.dart';
import 'package:api_demo/widgets/icon_widget.dart';
import 'package:api_demo/widgets/text2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:api_demo/app/models/movie_model.dart';
import 'package:api_demo/utils/api_const.dart';

class DetailsScreen extends StatelessWidget {
  DetailsScreen({Key? key, required this.movie}) : super(key: key);

  final MovieController movieController = Get.put(MovieController());
  final Result movie;
  bool isFavorite = false;
  final FavoriteController favoriteController = Get.put(FavoriteController());

  
    
void toggleFavorite() {

    if (isFavorite) {
      favoriteController.removeFavorite(movie);
    } else {
      favoriteController.addFavorite(movie);
    }
    isFavorite = !isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: toggleFavorite,
        child: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
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
                  decoration: BoxDecoration(color: Colors.black.withOpacity(0.2)),
                ),
              ),
            ),
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 20, left: 20, right: 20),
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
                              : Center(
                                  child: Text("No Image Available"),
                                ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    IconButton(
                      onPressed: toggleFavorite,
                      icon: 
                         Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: Colors.red,
                          size: 30,
                      ),
                    ),
                    Text(
                      movie.title,
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 1,
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colours.scaffoldBgColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          'IMDB  ${movie.voteAverage.toStringAsFixed(1)}',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      movie.overview,
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 20),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Text(
                          "Rating ",
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
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
                    SizedBox(height: 20),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: (movie.backdropPath.isNotEmpty)
                          ? SizedBox(
                              height: 200,
                              child: Image.network("$imagePath${movie.backdropPath}"),
                            )
                          : Center(
                              child: Text("No Image Available"),
                            ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
