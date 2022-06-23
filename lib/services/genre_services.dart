import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/Genre.dart';
const API_KEY = "3d44f65840138034df3f1365937d3179";
final API_URL = "api.themoviedb.org";
  // https://api.themoviedb.org/3/genre/movie/list?api_key=3d44f65840138034df3f1365937d3179&language=en-US

Future<List<Genre>> getGenresMovies() async {
   final queryParameters = {
      'apiKey': API_KEY
    };
  
   var url= Uri.https(
     "api.themoviedb.org",
     '/3/genre/movie/list',
     queryParameters);

   var response  = await http.get(url);
   if (response.statusCode == 200) {
    Map data = json.decode(response.body);
     if (data['Response'] == "True") {
      var list = (data['Search'] as List)
          .map((item) => new Genre.fromJson(item))
          .toList();
      return list;
    } else {
      throw Exception(data['Error']);
    }
  } else {
    throw Exception('Something went wrong !');
  }
}


