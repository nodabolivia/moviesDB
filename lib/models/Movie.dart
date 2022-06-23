// To parse this JSON data, do
//
//     final movie = movieFromJson(jsonString);

import 'dart:ffi';

import 'package:meta/meta.dart';
import 'dart:convert';

class Movie {
  Movie({
    required this.adult,
    required this.backdropPath,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  final bool? adult;
  final String? backdropPath;
  final int id;
  final String? originalLanguage;
  final String? originalTitle;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final DateTime releaseDate;
  final String? title;
  final bool? video;
  final double? voteAverage;
  final int? voteCount;

  factory Movie.fromRawJson(String str) => Movie.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  // factory Movie.fromJson(Map<String, dynamic> json) => Movie(
  //     adult: json["adult"],
  //     backdropPath: json["backdrop_path"],
  //     genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
  //     id: json["id"],
  //     originalLanguage: json["original_language"],
  //     originalTitle: json["original_title"],
  //     overview: json["overview"],
  //     popularity: json["popularity"].toDouble(),
  //     posterPath: json["poster_path"],
  //     releaseDate: DateTime.parse(json["release_date"]),
  //     title: json["title"],
  //     video: json["video"],
  //     voteAverage: json["vote_average"].toDouble(),
  //     voteCount: json["vote_count"],
  // );

  static Movie fromJson(Map<String, dynamic> json) {
    return Movie(
        adult: (json["backdrop_path"] == null) ? false : (json["backdrop_path"]==1)? true:false, 
       
        backdropPath: (json["backdrop_path"] == null)
            ? ""
            : json["backdrop_path"] as String,
        // genreIds: (json['genre_ids'] as List).map((e) => e as int).toList(),
        id: (json["id"] == null) ? 0 : json["id"] as int,
        originalLanguage: (json["original_language"] == null)
            ? ""
            : json["original_language"] as String,
        originalTitle: (json["original_title"] == null)
            ? ""
            : json["original_title"] as String,
        overview: (json["overview"] == null) ? "" : json["overview"] as String,
        popularity:
            (json["popularity"] == null) ? 0 : json["popularity"].toDouble(),
        posterPath:
            (json["poster_path"] == null) ? "" : json["poster_path"] as String,
        releaseDate: (json["release_date"] == null||json["release_date"] == "")
            ? DateTime.now()
            : DateTime.parse(json["release_date"]),
        // releaseDate: json["release_date"] as String,
        title: (json["title"] == null) ? "" : json["title"] as String,
        video: (json["video"] == null) ? false : (json["video"]==1)? true:false,
        voteAverage: (json["vote_average"] == null)
            ? 0
            : json["vote_average"].toDouble(),
        voteCount:
            (json["vote_count"] == null) ? 0 : json["vote_count"] as int);
  }

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "id": id,
        "original_language": originalLanguage,
        "original_title": originalTitle,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "release_date":
            "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "title": title,
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
      };

  String getImage() {
    return "https://image.tmdb.org/t/p/w500/" + this.posterPath!;
  }
}
