// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:api_demo/app/models/tvshows_model.dart';
import 'package:api_demo/utils/api_const.dart';

class TvShowDetailsScreen extends StatelessWidget {
  const TvShowDetailsScreen({
    Key? key,
    required this.tvshow,
    
  }) : super(key: key);

  final Results tvshow;
  

  @override
  Widget build(BuildContext context) {
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
                  image: NetworkImage('$imagePath${tvshow.posterPath}'),
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
                  children: [const SizedBox(height: 30),
                      IconButton(onPressed: (){
                        Navigator.pop(context);
                      }, icon: const Icon(Icons.arrow_back_ios)),

                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 20, right: 20),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: SizedBox(
                          width: double.infinity,
                          height: 400,
                          child: Image.network(
                            '$imagePath${tvshow.posterPath}',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(tvshow.name,
                        style: GoogleFonts.poppins(
                            fontSize: 20, fontWeight: FontWeight.w600),
                        maxLines: 2),
                    const SizedBox(height: 20),
                    Text(tvshow.overview,
                        style: GoogleFonts.poppins(
                            fontSize: 15, fontWeight: FontWeight.w500)),
                    const SizedBox(height: 20),
                    
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Text("Rating ",
                            style: GoogleFonts.poppins(
                                fontSize: 15, fontWeight: FontWeight.w500)),
                        const Icon(Icons.star, color: Colors.amber),
                        Text(" ${tvshow.voteAverage.toStringAsFixed(1)} / 10"),
                        
                      ],
                    ),
                    const SizedBox(height: 20),

                    ClipRRect(borderRadius: BorderRadius.circular(12),
                      child: SizedBox(height: 200,
                        child: Image.network("$imagePath${tvshow.backdropPath}"),
                      ),
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
