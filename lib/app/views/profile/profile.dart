import 'package:api_demo/app/controller/fav_controller.dart';
import 'package:api_demo/app/views/details/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   var controller = Get.put(FavoriteController());

    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Movies'),
      ),
      body: Obx(() {
        final favoriteMovies = controller.favoriteMovies;
        if (favoriteMovies.isEmpty) {
          return Center(
            child: Text('You have no favorite movies.'),
          );
        } else {
          return ListView.builder(
            itemCount: favoriteMovies.length,
            itemBuilder: (context, index) {
              final movie = favoriteMovies[index];
              return GestureDetector(
                onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  DetailsScreen(movie: movie),
                            ),
                          );},
                child: Card(
                  child: ListTile(
                    title: Text(movie.title),
                  ),
                ),
              );
            },
          );
        }
      }),
    );
  }
}
