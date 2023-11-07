
import 'package:api_demo/app/models/movie_model.dart';
import 'package:get/get.dart';

class FavoriteController extends GetxController {
  RxList<Result> favoriteMovies = <Result>[].obs;

  // Add a movie to the list of favorite movies.
  void addFavorite(Result movie) {
    favoriteMovies.add(movie);
  }

  // Remove a movie from the list of favorite movies.
  void removeFavorite(Result movie) {
    favoriteMovies.remove(movie);
  }

  // Check if a movie is in the list of favorite movies.
  bool isFavorite(Result movie) {
    return favoriteMovies.contains(movie);
  }
}
