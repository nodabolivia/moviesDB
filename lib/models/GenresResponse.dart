
import 'package:flutter_application_movies/models/Genre.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

class GenresResponse {
    GenresResponse({
        required this.genres,
    });

    final List<Genre> genres;

    factory GenresResponse.fromRawJson(String str) => GenresResponse.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GenresResponse.fromJson(Map<String, dynamic> json) => GenresResponse(
        genres: List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "genres": List<dynamic>.from(genres.map((x) => x.toJson())),
    };
}