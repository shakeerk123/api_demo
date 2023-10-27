import 'package:get/get.dart';
import 'package:api_demo/app/models/popularModel.dart';

class FavoriteController extends GetxController {
  var favoriteMovies = <Result>[].obs;

  void toggleFavorite(Result movie) {
    if (favoriteMovies.contains(movie)) {
      favoriteMovies.remove(movie);
    } else {
      favoriteMovies.add(movie);
    }
  }

  bool isFavorite(Result movie) {
    return favoriteMovies.contains(movie);
  }
}
