import 'package:get/get.dart';
import 'package:api_demo/app/models/popularModel.dart';
import 'package:hive_flutter/adapters.dart';

class FavoriteController extends GetxController {
  var favoriteMovies = <Result>[].obs;

  void toggleFavorite(Result movie) async{
    final box = await Hive.openBox<String>('movieBox');
    if (favoriteMovies.contains(movie)) {
      box.add(movie.title);
    } else {
      box.delete(movie.title);
    }
  }

  bool isFavorite(Result movie) {
    return favoriteMovies.contains(movie);
  }
}
