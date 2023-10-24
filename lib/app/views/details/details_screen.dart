import 'dart:ui';

import 'package:api_demo/app/models/popularModel.dart';
import 'package:api_demo/utils/api_const.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final Result movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 50,left: 20,right: 20),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: SizedBox(
                          width: double.infinity,
                          height: 400,
                          child: Image.network(
                            '$imagePath${movie.posterPath}',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(movie.title,
                        style: GoogleFonts.poppins(
                            fontSize: 20, fontWeight: FontWeight.w600),
                        maxLines: 2),
                    const SizedBox(height: 20),
                    Text(movie.overview,
                        style: GoogleFonts.poppins(
                            fontSize: 15, fontWeight: FontWeight.w500)),
                    const SizedBox(height: 20),
                     Row(
                      children: [
                        Text("Rating ",style: GoogleFonts.poppins(
                            fontSize: 15, fontWeight: FontWeight.w500)),
                        Icon(Icons.star, color: Colors.amber),Text(" ${movie.voteAverage.toStringAsFixed(1)} / 10")
                      ],
                    )
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
