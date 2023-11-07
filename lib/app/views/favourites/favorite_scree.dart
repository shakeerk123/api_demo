import 'package:api_demo/app/views/details/details_screen.dart';
import 'package:api_demo/utils/api_const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:api_demo/app/controller/fav_controller.dart';
 // Import your DetailsScreen

class FavoriteMoviesScreen extends StatelessWidget {
  final FavoriteController favoriteController = Get.put(FavoriteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorite Movies"),
      ),
      body: Obx(() {
        final favoriteMovies = favoriteController.favoriteMovies;

        if (favoriteMovies.isEmpty) {
          return Center(
            child: Text("No favorite movies yet."),
          );
        }

        return ListView.builder(
          itemCount: favoriteMovies.length,
          itemBuilder: (context, index) {
            final movie = favoriteMovies[index];
            return GestureDetector(
              onTap: () {
                // Navigate to the DetailsScreen when tapping a favorite movie.
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => DetailsScreen(movie: movie),
                  ),
                );
              },
              child: ListTile(
                leading: Image.network('$imagePath${movie.posterPath}'),
                title: Text(movie.title),
                subtitle: Text("Rating: ${movie.voteAverage.toStringAsFixed(1)}"),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    // Remove the movie from favorites when the delete button is pressed.
                    favoriteController.removeFavorite(movie);
                  },
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
