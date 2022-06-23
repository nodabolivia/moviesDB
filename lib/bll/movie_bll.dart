import 'dart:developer';

import 'package:flutter_application_movies/models/Movie.dart';
import 'package:sqflite/sqflite.dart';

import '../providers/database_provider.dart';

class MovieBLL {
  static Future<List<Movie>> selectAll() async {
    final db = await DatabaseProvider.database;
    final res = await db.rawQuery('SELECT * FROM movies');
    return res.isNotEmpty ? res.map((c) => Movie.fromJson(c)).toList() : [];
  }

  static Future<void> insert(Movie movie) async {
    final db = await DatabaseProvider.database;
    final res = await db.insert(
      "movies",
      movie.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    log(res.toString());
  }
}
