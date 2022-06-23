import 'package:flutter/material.dart';
import 'package:flutter_application_movies/bll/movie_bll.dart';
import 'package:flutter_application_movies/models/Movie.dart';
import 'package:flutter_application_movies/pages/detail.dart';

Widget movieItem(Movie movie, BuildContext context) {

    return ListTile(
      title: Text("${movie.title}"),
      subtitle: Text(
          "${movie.voteAverage.toString()} (${movie.voteCount.toString()})"),
      trailing: (movie.posterPath!="")?Image.network("${movie.getImage()}"): Image.asset("assets/noImage.jpg"),
      onTap: () {
        // Movie temp= 
        //  Movie(
        //     adult: movie.adult,
        //     backdropPath: movie.backdropPath,
        //     genreIds: movie.genreIds.toString(),
        //     id: 0,
        //     originalLanguage: "",
        //     originalTitle: "",
        //     overview: "",
        //     popularity: 0,
        //     posterPath: "",
        //     releaseDate: DateTime.now(),
        //     title: "",
        //     video: false,
        //     voteAverage: 0,
        //     voteCount: 0);
        MovieBLL.insert(movie);
        Navigator.pushNamed(context, '/detail', arguments: {'movie': movie});

      },
    );
  
}
