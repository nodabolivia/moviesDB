import 'package:flutter/material.dart';
import 'package:flutter_application_movies/components/movie_item.dart';
import 'package:flutter_application_movies/components/spinner.dart';
import 'package:flutter_application_movies/services/movie_services.dart';

class SearchPage extends StatelessWidget {
   final Map<String, dynamic>? args;
  const SearchPage(this.args, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String query = args?.containsKey('query') ?? false ? args!['query'] : "";
    return Scaffold(
      appBar: AppBar(
        title: const Text("Resultados de búsqueda"),
      ),
      body: FutureBuilder(
        future: MoviesService.getSearch(query),
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
