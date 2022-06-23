import 'dart:convert' as convert;
import 'package:flutter_application_movies/models/Movie.dart';
import 'package:flutter_application_movies/models/Movies.dart';
import 'package:http/http.dart' as http;

class MoviesService {
  static final String API_URL = "https://api.themoviedb.org/3";
  static final String API_KEY = "3d44f65840138034df3f1365937d3179";
  // https://api.themoviedb.org/3/search/movie?api_key=3d44f65840138034df3f1365937d3179&language=en-US&page=1&query=barbie&include_adult=false

  static Future<List<Movie>> getTopRatedMovie() async {
    var url = API_URL + "/movie/top_rated?api_key=" + API_KEY + "&language=es";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final responseJSON = convert.json.decode(response.body);
      final moviesTopRated = Movies.fromJsonList(responseJSON['results']);
      return moviesTopRated;
    }
    return <Movie>[];
  }
  //https://api.themoviedb.org/3/search/movie?api_key=3d44f65840138034df3f1365937d3179&language=en-US&page=1&query=barbie&include_adult=false
    static Future<List<Movie>> getSearch(String query) async {
    var url = API_URL + "/search/movie?api_key=" + API_KEY + "&language=es&query="+query.toString();
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final responseJSON = convert.json.decode(response.body);
      final moviesTopRated = Movies.fromJsonList(responseJSON['results']);
      return moviesTopRated;
    }
    return <Movie>[];
  }
}
