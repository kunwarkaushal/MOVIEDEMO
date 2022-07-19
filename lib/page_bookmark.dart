import 'package:flutter/material.dart';
import 'package:demoproject/screen/movietile_page.dart';
import '/services/movies_remote_service.dart';
import '/models/topmovies.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class PageBookmark extends StatefulWidget {
  final itemIndex;
  PageBookmark({required this.itemIndex});

  @override
  State<PageBookmark> createState() => _PageBookmarkState(this.itemIndex);
}

class _PageBookmarkState extends State<PageBookmark> {
  bool isLoaded = false;
  Future<Movies>? movieData;
  Future<Movies> getList() async {
    MoviesRemoteService moviesRemoteService = MoviesRemoteService();
    var movies = await moviesRemoteService.getMovieDetail();
    return movies;
  }

  _PageBookmarkState(int itemIndex) {
    this._itemIndex = itemIndex;
    print('This is the index = $_itemIndex');
  }
  late int _itemIndex;

  @override
  void initState() {
    // todo implement initState
    movieData = getList();
    super.initState();
  }

  getData(var movieData) async {
    if (movieData != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MovieTilePage(movieData: movieData, items: _itemIndex);

  }
}

