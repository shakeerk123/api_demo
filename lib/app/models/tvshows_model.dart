// To parse this JSON data, do
//
//     final tvshowsDataModel = tvshowsDataModelFromJson(jsonString);

import 'dart:convert';

TvshowsDataModel tvshowsDataModelFromJson(String str) => TvshowsDataModel.fromJson(json.decode(str));



class TvshowsDataModel {
    int page;
    List<Results> results;
    int totalPages;
    int totalResults;

    TvshowsDataModel({
        required this.page,
        required this.results,
        required this.totalPages,
        required this.totalResults,
    });

    factory TvshowsDataModel.fromJson(Map<String, dynamic> json) => TvshowsDataModel(
        page: json["page"],
        results: List<Results>.from(json["results"].map((x) => Results.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
    );

   
}

class Results {
    String backdropPath;
    DateTime firstAirDate;
    List<int> genreIds;
    int id;
    String name;
    List<String> originCountry;
    String originalLanguage;
    String originalName;
    String overview;
    double popularity;
    String posterPath;
    double voteAverage;
    int voteCount;

    Results({
        required this.backdropPath,
        required this.firstAirDate,
        required this.genreIds,
        required this.id,
        required this.name,
        required this.originCountry,
        required this.originalLanguage,
        required this.originalName,
        required this.overview,
        required this.popularity,
        required this.posterPath,
        required this.voteAverage,
        required this.voteCount,
    });

    factory Results.fromJson(Map<String, dynamic> json) => Results(
        backdropPath: json["backdrop_path"],
        firstAirDate: DateTime.parse(json["first_air_date"]),
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"],
        name: json["name"],
        originCountry: List<String>.from(json["origin_country"].map((x) => x)),
        originalLanguage: json["original_language"],
        originalName: json["original_name"],
        overview: json["overview"],
        popularity: json["popularity"]?.toDouble(),
        posterPath: json["poster_path"],
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
    );

    
}
