import 'package:flutter/material.dart';
import 'package:flutter_application_movies/components/movie_item.dart';
import 'package:flutter_application_movies/components/spinner.dart';
import 'package:flutter_application_movies/services/movie_services.dart';

class TopRatedPage extends StatefulWidget {
  const TopRatedPage({Key? key}) : super(key: key);

  @override
  State<TopRatedPage> createState() => _TopRatedPageState();
}

class _TopRatedPageState extends State<TopRatedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pelis más valoradas"),
      ),
      body: FutureBuilder(
        future: MoviesService.getTopRatedMovie(),
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  var data = snapshot.data![index];
                  return movieItem(data, context);
                });
          } else {
            return SpinnerWidget();
          }
        },
      ),
    );
  }
}
