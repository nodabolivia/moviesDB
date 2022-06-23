import 'Movie.dart';

class Movies {
  Movies();
  static List<Movie> fromJsonList(List<dynamic> jsonList) {
    List<Movie> movies = [];
    if(jsonList != null) {
      for (var item in jsonList) {
        final movie= Movie.fromJson(item);
        movies.add(movie);
      }
    }
    return movies;

  }
}
