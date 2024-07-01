


import 'dart:math';

import 'package:movie_provider/models/movie_model.dart';
import 'package:flutter/foundation.dart';

final List<Movie> initialData= List.generate(
    50, (index) => Movie(
    title: "Movie $index",
    duration:"${Random().nextInt(100)+60} minutes" ));

class MovieProvider extends ChangeNotifier{
  final List<Movie> _movies=initialData;
  List<Movie> get movies=> _movies;

  final List<Movie> _mylist=[];
  List<Movie> get mylist => _mylist;

  void addToList(Movie movie){
    _mylist.add(movie)    ;
    notifyListeners();
  }

  void deleteFromList (Movie movie){
    _mylist.remove(movie);
    notifyListeners();
  }

}