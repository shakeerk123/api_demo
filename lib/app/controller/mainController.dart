
// ignore_for_file: file_names, prefer_typing_uninitialized_variables

import 'package:api_demo/app/api/api_services.dart';
import 'package:get/get.dart';

class MainController extends GetxController{

var currentIndex = 0.obs;
var popularmovies;
var topratedmovies;
var upComingmovies;
var nowPlayingmovies;
var malayalamMovies;
var animationMovies;
var airTvshows;

@override
  void onInit(){
    airTvshows = getAirTvShows();
    malayalamMovies = getMalayalamMovies();
    popularmovies = getPopularMovies();
    topratedmovies = getTopRatedMovies();
    upComingmovies = getUpcomingMovies();
    nowPlayingmovies = getNowPlayingMovies();
    animationMovies = getAnimationMovies();
  
    super.onInit();
  }

void onTap(int index){
  currentIndex.value = index ;
}


}