import 'package:flutter/material.dart';
import 'package:demoproject/screen/movietile_page.dart';
import 'package:demoproject/screen/trendingtile_page.dart';
import '../models/trending.dart';
import '../services/trending_remote.dart';
import '/services/movies_remote_service.dart';
import '/models/topmovies.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class TrendingPage extends StatefulWidget {
  final itemIndex;
  TrendingPage({required this.itemIndex});

  @override
  State<TrendingPage> createState() => _TrendingPageState(this.itemIndex);
}

class _TrendingPageState extends State<TrendingPage> {
  bool isLoaded = false;
  Future<Trending>? movieData;
  Future<Trending> getList() async {
    TrendingRemoteService trendingRemoteService = TrendingRemoteService();
    var movies = await trendingRemoteService.getMovieDetail();
    getData(movieData);
    return movies;
  }

  _TrendingPageState(int itemIndex) {
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
    return TrendingTilePage(movieData: movieData, items: _itemIndex);
    // Container(
    //   color: const Color(0xff1A6350),
    //   child: Scaffold(
    //     backgroundColor: Colors.transparent,
    //     body: Visibility(
    //       visible: isLoaded,
    //       child: SingleChildScrollView(
    //         child: Container(
    //           width: MediaQuery.of(context).size.width,
    //           height: MediaQuery.of(context).size.height,
    //           child: MovieDetail(movieData: movieData, items: _itemIndex),
    //         ),
    //       ),
    //       replacement: const Center(
    //         child: CircularProgressIndicator(
    //           color: Color.fromARGB(255, 13, 81, 62),
    //           backgroundColor: Color.fromARGB(255, 61, 164, 135),
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}
