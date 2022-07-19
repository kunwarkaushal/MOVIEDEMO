import 'package:flutter/material.dart';
import 'package:demoproject/models/tvseries.dart';
import 'package:demoproject/screen/tvseriestile_page.dart';
import 'package:demoproject/services/tvseries_remote.dart';

class TVSeriesPage extends StatefulWidget {
  final itemIndex;
  TVSeriesPage({required this.itemIndex});

  @override
  State<TVSeriesPage> createState() => _TVSeriesPageState(this.itemIndex);
}

class _TVSeriesPageState extends State<TVSeriesPage> {
  bool isLoaded = false;
  Future<TVSeries>? movieData;
  Future<TVSeries> getList() async {
    TVSeriesRemoteService tvSeriesRemoteService = TVSeriesRemoteService();
    var movies = await tvSeriesRemoteService.getMovieDetail();
    getData(movieData);
    return movies;
  }

  _TVSeriesPageState(int itemIndex) {
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
    return TVSeriesTilePage(movieData: movieData, items: _itemIndex);
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
