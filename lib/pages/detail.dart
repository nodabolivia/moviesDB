import 'package:flutter/material.dart';
import 'package:flutter_application_movies/bll/movie_bll.dart';
import 'package:flutter_application_movies/models/Movie.dart';

class DetailPage extends StatelessWidget {
  final Map<String, dynamic>? args;
  const DetailPage(this.args, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    Movie movie = args?.containsKey('movie') ?? false
        ? args!['movie']
        : Movie(
            adult: false,
            backdropPath: "",
            // genreIds: List.empty(),
            id: 0,
            originalLanguage: "",
            originalTitle: "",
            overview: "",
            popularity: 0,
            posterPath: "",
            releaseDate: DateTime.now(),
            title: "",
            video: false,
            voteAverage: 0,
            voteCount: 0);
    // MovieBLL.insert(movie);
    return Scaffold(
      appBar: AppBar(title: Text(" ${movie.title}")),
      body: ListView(
        padding: const EdgeInsets.all(15.0),
        children: <Widget>[
          Text("${movie.title} - (${movie.releaseDate.year})",
              style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown)),
          const SizedBox(
            height: 10,
          ),
          Text("Rating: ${movie.voteAverage}",
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown)),
          const SizedBox(
            height: 10,
          ),

          // Text("${movie.tiempoDuracion}"),
          // Text("${movie.Director}"),
          // Text("${movie.genero}"),
          (movie.posterPath != "")
              ? Image.network(movie.getImage(),
                  width: width / 2, height: height / 2, fit: BoxFit.fitHeight)
              : Image.asset("assets/noImage.jpg",
                  width: width / 3, height: height / 3, fit: BoxFit.fitHeight),
          const SizedBox(
            height: 20,
          ),

          const Text("Sinopsis:",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown)),
          Text(" ${movie.overview}",
              style: const TextStyle(fontSize: 14, color: Colors.black)),
        ],
      ),
    );
  }
}
