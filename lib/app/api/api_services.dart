import 'dart:developer';

import 'package:api_demo/app/models/tvshows_model.dart';
import 'package:api_demo/utils/api_const.dart';
import 'package:api_demo/app/models/popularModel.dart';
import 'package:http/http.dart' as http;

var _trendingLink = 'https://api.themoviedb.org/3/trending/movie/day?api_key=$apiKey';
var _topRatedLink = 'https://api.themoviedb.org/3/movie/top_rated?api_key=$apiKey';
var _upcomingLink = 'https://api.themoviedb.org/3/movie/upcoming?api_key=$apiKey';
var _nowPlayingLink = 'https://api.themoviedb.org/3/movie/now_playing?api_key=$apiKey';
var _animationLink = 'https://api.themoviedb.org/3/discover/movie?api_key=$apiKey&with_genres=16';
var _malayalamMovieLink = 'https://api.themoviedb.org/3/discover/movie?api_key=$apiKey&with_original_language=ml';
//var _populartvshowsLink = 'https://api.themoviedb.org/3/discover/tv?api_key=$apiKey&with_original_language=ml';
var _airtvshowsLink = 'https://api.themoviedb.org/3/tv/airing_today?api_key=$apiKey';


getAirTvShows()async{
   var res = await http.get(Uri.parse(_airtvshowsLink));
   if(res.statusCode == 200){
    var data = tvshowsDataModelFromJson(res.body.toString());
    log("data recieved");
    return data;
   }
}

getAnimationMovies()async{
   var res = await http.get(Uri.parse(_animationLink));
   if(res.statusCode == 200){
    var data = movieDataModelFromJson(res.body.toString());
    log("data recieved");
    return data;
   }
}


getMalayalamMovies()async{
   var res = await http.get(Uri.parse(_malayalamMovieLink));
   if(res.statusCode == 200){
    var data = movieDataModelFromJson(res.body.toString());
    log("data recieved");
    return data;
   }
}


getPopularMovies()async{
   var res = await http.get(Uri.parse(_trendingLink));
   if(res.statusCode == 200){
    var data = movieDataModelFromJson(res.body.toString());
    log("data recieved");
    return data;
   }
}

getTopRatedMovies()async{
   var res = await http.get(Uri.parse(_topRatedLink));
   if(res.statusCode == 200){
    var data = movieDataModelFromJson(res.body.toString());
    log("data recieved");
    return data;
   }
}

getUpcomingMovies()async{
   var res = await http.get(Uri.parse(_upcomingLink));
   if(res.statusCode == 200){
    var data = movieDataModelFromJson(res.body.toString());
    log("data recieved");
    return data;
   }
}
getNowPlayingMovies()async{
   var res = await http.get(Uri.parse(_nowPlayingLink));
   if(res.statusCode == 200){
    var data = movieDataModelFromJson(res.body.toString());
    log("data recieved");
    return data;
   }
}