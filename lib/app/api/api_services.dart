
import 'dart:developer';
import 'package:api_demo/app/models/video_model.dart';
import 'package:api_demo/utils/api_const.dart';
import 'package:api_demo/app/models/movie_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ApiClient extends GetxController {
  final _hindiLink =
      "$baseURL/discover/movie?api_key=$apiKey&language=hi&with_original_language=hi";
  final _trendingLink = '$baseURL/trending/movie/day?api_key=$apiKey';
  final _topRatedLink = '$baseURL/movie/top_rated?api_key=$apiKey';
  final _upcomingLink = '$baseURL/movie/upcoming?api_key=$apiKey';
  final _nowPlayingLink = '$baseURL/movie/now_playing?api_key=$apiKey';
  final _animationLink =
      '$baseURL/discover/movie?api_key=$apiKey&with_genres=16';
  final _malayalamLink =
      '$baseURL/discover/movie?api_key=$apiKey&with_original_language=ml';
  final _tamilLink =
      '$baseURL/discover/movie?api_key=$apiKey&with_original_language=ta';

  Future<MovieDataModel> _fetchMovieData(String url) async {
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var data = movieDataModelFromJson(response.body.toString());
      log("Data received");
      return data;
    } else {
      throw Exception('Failed to load movie data');
    }
  }

  Future<VideoDataModel> getMovieVideos(int movieId) async {
    final videosUrl = '$baseURL/movie/$movieId/videos?api_key=$apiKey';

    try {
      final response = await http.get(Uri.parse(videosUrl));
      if (response.statusCode == 200) {
        final data = videoDataModelFromJson(response.body.toString());
        log("Movie videos received");
        return data;
      } else {
        throw Exception('Failed to load movie videos');
      }
    } catch (e) {
      throw Exception('Failed to fetch movie videos: $e');
    }
  }

  Future<MovieDataModel> getHindiMovies() async {
    return await _fetchMovieData(_hindiLink);
  }

  Future<MovieDataModel> getTamilMovie() async {
    return await _fetchMovieData(_tamilLink);
  }

  Future<MovieDataModel> getAnimationMovies() async {
    return await _fetchMovieData(_animationLink);
  }

  Future<MovieDataModel> getMalayalamMovies() async {
    return await _fetchMovieData(_malayalamLink);
  }

  Future<MovieDataModel> getPopularMovies() async {
    return await _fetchMovieData(_trendingLink);
  }

  Future<MovieDataModel> getTopRatedMovies() async {
    return await _fetchMovieData(_topRatedLink);
  }

  Future<MovieDataModel> getUpcomingMovies() async {
    return await _fetchMovieData(_upcomingLink);
  }

  Future<MovieDataModel> getNowPlayingMovies() async {
    return await _fetchMovieData(_nowPlayingLink);
  }

  
}
