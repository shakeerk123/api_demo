import 'dart:developer';

import 'package:api_demo/utils/api_const.dart';
import 'package:api_demo/app/models/popularModel.dart';
import 'package:http/http.dart' as http;

var link = 'https://api.themoviedb.org/3/trending/movie/day?api_key=${apiKey}';


getPopularMovies()async{
   var res = await http.get(Uri.parse(link));
   if(res.statusCode == 200){
    var data = movieDataModelFromJson(res.body.toString());
    log("data recieved");
    return data;
   }
}