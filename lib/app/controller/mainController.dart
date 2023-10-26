// ignore_for_file: prefer_typing_uninitialized_variables, file_names


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:api_demo/app/api/api_services.dart';

class MainController extends GetxController {
TextEditingController searchTextField = TextEditingController();

  var currentIndex = 0.obs;
  
  var popularmovies;
  var topratedmovies;
  var upComingmovies;
  var nowPlayingmovies;
  var malayalamMovies;
  var animationMovies;
  var tamilMovie;
  var searchMovie;

  

  @override
  void onInit() {
    
    tamilMovie = getTamilMovie();
    malayalamMovies = getMalayalamMovies();
    popularmovies = getPopularMovies();
    topratedmovies = getTopRatedMovies();
    upComingmovies = getUpcomingMovies();
    nowPlayingmovies = getNowPlayingMovies();
    animationMovies = getAnimationMovies();

    super.onInit();
  }

  void onTap(int index) {
    currentIndex.value = index;
  }
   
}
