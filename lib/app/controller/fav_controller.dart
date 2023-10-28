import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteController extends GetxController {
  final RxList<String> favoriteTitles = <String>[].obs;

  Future<void> toggleFavorite(String title) async {
    final prefs = await SharedPreferences.getInstance();

    if (favoriteTitles.contains(title)) {
      favoriteTitles.remove(title);
    } else {
      favoriteTitles.add(title);
    }

    await prefs.setStringList('favorite_titles', favoriteTitles);
  }

  bool isFavorite(String title) {
    return favoriteTitles.contains(title);
  }

  @override
  void onInit() {
    super.onInit();
    loadFavoriteTitles();
  }

  Future<void> loadFavoriteTitles() async {
    final prefs = await SharedPreferences.getInstance();
    final storedTitles = prefs.getStringList('favorite_titles') ?? [];
    favoriteTitles.assignAll(storedTitles);
  }
}
