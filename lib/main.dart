import 'package:flutter/material.dart';
import 'package:flutter_application_movies/pages/detail.dart';
import 'package:flutter_application_movies/pages/history.dart';
import 'package:flutter_application_movies/pages/home.dart';
import 'package:flutter_application_movies/pages/search.dart';
import 'package:flutter_application_movies/pages/topRated.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Search',
      theme: ThemeData(
        primarySwatch: Colors.red,
        hoverColor: Colors.redAccent,
        backgroundColor: Colors.black        
      ),
      routes: {
        '/':(context)=>const HomePage( title: "Películas"),
        '/search':
        ((context)=> SearchPage(
          ModalRoute.of(context)!.settings.arguments as Map<String,dynamic> )),   
        '/history':(context)=>const HistoryPage(),
        '/detail':
        ((context)=> DetailPage(
          ModalRoute.of(context)!.settings.arguments as Map<String,dynamic> 
        ))
        // '/results':(context)=>const HomePage("Resultado de busqueda"),

      },
      initialRoute: '/',
    );
  }
}

