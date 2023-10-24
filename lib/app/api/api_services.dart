import 'dart:developer';

import 'package:api_demo/utils/api_const.dart';
import 'package:api_demo/app/models/popularModel.dart';
import 'package:http/http.dart' as http;

var _trendingLink = 'https://api.themoviedb.org/3/trending/movie/day?api_key=$apiKey';
var _topRatedLink = 'https://api.themoviedb.org/3/movie/top_rated?api_key=$apiKey';


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