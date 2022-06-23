import 'package:flutter/material.dart';
import 'package:flutter_application_movies/bll/movie_bll.dart';
import 'package:flutter_application_movies/components/movie_item.dart';
import 'package:flutter_application_movies/components/spinner.dart';
import 'package:flutter_application_movies/services/movie_services.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Historial de búsqueda"),
      ),
      body: FutureBuilder(
        future: MovieBLL.selectAll(),
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
