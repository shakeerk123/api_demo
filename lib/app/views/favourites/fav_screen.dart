import 'package:api_demo/app/controller/fav_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavoriteController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Movies'),
      ),
      body: Obx(
        () {
          final favoriteTitles = controller.favoriteTitles;
          if (favoriteTitles.isEmpty) {
            return const Center(
              child: Text('You have no favorite movies.'),
            );
          } else {
            return ListView.builder(
              itemCount: favoriteTitles.length,
              itemBuilder: (context, index) {
                final title = favoriteTitles[index];

                return Dismissible(
                  key: UniqueKey(),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 20.0),
                    child: const Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                  onDismissed: (direction) {
                    controller.toggleFavorite(title);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                    child: Card(
                      child: ListTile(
                        trailing: Text("<<< delete",style: GoogleFonts.raleway(fontSize: 6),),
                        title: Text(title),
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
