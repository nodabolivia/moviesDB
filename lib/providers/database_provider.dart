import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseProvider {
  static Database? _database;
  static final DatabaseProvider db = DatabaseProvider._();

  DatabaseProvider._();

  static Future<Database> get database async {
    if (_database == null) {
      _database = await crearBD();
    }
    return _database!;
  }
  
  static crearBD() async {
    Directory docsDirectory = await getApplicationDocumentsDirectory();
    final path = "${docsDirectory.path}dbmoviesD.db";
    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: (Database db, int version) async {
        await db.execute(
          "CREATE TABLE movies ("
          "id INTEGER  PRIMARY KEY AUTOINCREMENT,"
          "adult BOOLEAN,"
          "backdrop_path TEXT,"
          "genre_ids TEXT,"
          "movie_id INTEGER,"
          "original_language TEXT,"
          "original_title TEXT,"
          "overview TEXT,"
          "popularity DECIMAL(3,3),"
          "poster_path TEXT,"
          "release_date TEXT,"
          "title TEXT,"
          "video BOOLEAN,"
          "vote_average DECIMAL(3,3)," 
          "vote_count INTEGER"
          ")"
        );
      },
    );
  }
  }



