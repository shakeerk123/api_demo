import 'package:api_demo/app/controller/mainController.dart';
import 'package:api_demo/app/models/tvshows_model.dart';
import 'package:api_demo/app/views/details/tvshow_details.dart';
import 'package:api_demo/utils/api_const.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class PopularTvShows extends StatelessWidget {
  const PopularTvShows({
    super.key,
    required this.controller,
  });

  final MainController controller;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.airTvshows,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasData) {
          TvshowsDataModel? data = snapshot.data as TvshowsDataModel?;
          List<Results> results = data?.results ?? [];

          return SizedBox(
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
                            TvShowDetailsScreen(tvshow: results[index]),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: SizedBox(
                        width: 120,
                        child: Image.network("$imagePath$poster"),
                      ),
                    ),
                  ),
                );
              },
            ),
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
