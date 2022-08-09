import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:reea_test/models/movie.dart';

class HiveController{
  String boxName = 'movie_box';

  Future<Box<Movie>> openBox() async{
    Box<Movie> box = await Hive.openBox(boxName);
    return box;
  }

  List<Movie> getCachedMovies(Box<Movie> box){
    return box.values.toList();
  }

  Future<void> addMoviesToCache(Box<Movie> box, Movie movie)async{
    await box.put(movie.id, movie);
  }

  Future<void> clearCache(Box<Movie> box)async{
    await box.clear();
  }
}