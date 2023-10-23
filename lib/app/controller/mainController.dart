
// ignore_for_file: file_names

import 'package:api_demo/app/api/api_services.dart';
import 'package:get/get.dart';

class MainController extends GetxController{


var popularmovies;

@override
  void onInit(){
    popularmovies = getPopularMovies();
  
    super.onInit();
  }
}