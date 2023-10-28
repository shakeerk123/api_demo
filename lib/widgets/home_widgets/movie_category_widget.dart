import 'package:api_demo/app/views/details/details_screen.dart';
import 'package:api_demo/utils/api_const.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:api_demo/app/controller/main_controller.dart';
import 'package:api_demo/app/models/movie_model.dart';
import 'package:transparent_image/transparent_image.dart';

class MoviesCategory extends StatelessWidget {
  final String title;
  final Future<MovieDataModel> Function() fetchMovies;
  final MainController controller;

  const MoviesCategory({
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
        if (snapshot.connectionState == ConnectionState.waiting) {
          return _buildShimmerLoading();
        } else if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          if (snapshot.hasData) {
            return _buildMovieList(snapshot);
          } else {
            return const Text('No data available');
          }
        } else {
          return Text('Connection state: ${snapshot.connectionState}');
        }
      },
    );
  }

  Widget _buildShimmerLoading() {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Container(
              height: 20,
              width: 200,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          SizedBox(
            height: 200,
            width: double.infinity,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: SizedBox(
                      width: 120,
                      child: Container(
                        color: Colors.grey.shade300,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMovieList(AsyncSnapshot<dynamic> snapshot) {
    MovieDataModel? data = snapshot.data as MovieDataModel?;
    List<Result> results = data?.results ?? [];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            title,
            style: const TextStyle(fontSize: 20),
          ),
        ),
        SizedBox(
          height: 200,
          width: double.infinity,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: results.length,
            itemBuilder: (context, index) {
              String poster = results[index].posterPath;

              // ignore: unnecessary_null_comparison
              if (poster == null || poster.isEmpty) {
                return const SizedBox.shrink();
              }

              return GestureDetector(
                onTap: () {
                  Get.to(() => DetailsScreen(movie: results[index]));
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
  }
}
