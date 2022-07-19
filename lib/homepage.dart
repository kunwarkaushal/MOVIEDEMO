import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:demoproject/models/trending.dart';
import 'package:demoproject/models/tvseries.dart';

import 'package:demoproject/services/trending_remote.dart';
import 'package:demoproject/services/tvseries_remote.dart';
import 'package:demoproject/tiles/movietiles.dart';
import 'package:demoproject/tiles/trendingtiles.dart';
import 'package:demoproject/tiles/tvseriestile.dart';

import 'models/topmovies.dart';
import 'services/movies_remote_service.dart';

// import 'package:flutter/cupertino.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoaded = false;
  Future<Movies>? movieData;
  Future<Movies> getList() async {
    MoviesRemoteService moviesRemoteService = MoviesRemoteService();
    var movies = await moviesRemoteService.getMovieDetail();
    return movies;
  }

  Future<Trending>? trendingData;
  Future<Trending> getTrending() async {
    TrendingRemoteService trendingRemoteService = TrendingRemoteService();
    var movies = await trendingRemoteService.getMovieDetail();

    return movies;
  }

  Future<TVSeries>? tvSeriesData;
  Future<TVSeries> getTVSeries() async {
    TVSeriesRemoteService tvSeriesRemoteService = TVSeriesRemoteService();
    var movies = await tvSeriesRemoteService.getMovieDetail();

    return movies;
  }

  @override
  void initState() {
    // TODO: implement initState
    movieData = getList();
    trendingData = getTrending();
    tvSeriesData = getTVSeries();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    var _height = MediaQuery.of(context).size.height;

    return Container(
      color: Colors.blueAccent[100],
      width: _width,
      height: _height,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0.0,
          toolbarHeight: 60,
          backgroundColor: Colors.transparent,
          // leading: IconButton(
          //   onPressed: () {},
          //   icon: Icon(
          //     Icons.menu_rounded,
          //     size: 30,
          //   ),
          // ),
          title: Text(
            'Home',
          ),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          actions: [
            IconButton(
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: CustomSearchDelegate(),
                );
              },
              icon: Icon(
                Icons.search_outlined,
                size: 30,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              //*****Trending Movies*****
              Container(
                margin: const EdgeInsets.all(2),
                child: Text(
                  'Trending Movies',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                height: 290,
                width: _width,
                color: Colors.transparent,
                child: ListView.builder(
                  padding: const EdgeInsets.all(10),
                  addAutomaticKeepAlives: true,
                  itemCount: 15,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, int index) {
                    return TrendingTiles(movieData: trendingData, items: index);
                  },
                ),
              ),

              //*****TVSeries*****
              Container(
                margin: const EdgeInsets.all(2),
                child: Text(
                  'Trending TVSeries',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              // TrendingScreen(),
              Container(
                height: 290,
                width: _width,
                color: Colors.transparent,
                child: ListView.builder(
                  padding: const EdgeInsets.all(10),
                  addAutomaticKeepAlives: true,
                  itemCount: 15,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, int index) {
                    return TVSeriesTiles(movieData: tvSeriesData, items: index);
                  },
                ),
              ),
              //*****Top Rated Movies*****
              Container(
                margin: const EdgeInsets.all(2),
                child: Text(
                  'Top Rated Movies',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                height: 290,
                width: _width,
                color: Colors.transparent,
                child: ListView.builder(
                  padding: const EdgeInsets.all(10),
                  addAutomaticKeepAlives: true,
                  itemCount: 15,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, int index) {
                    return MovieTiles(movieData: movieData, items: index);
                  },
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  List<String> searchTerms = [
    'The Batman',
    'The Dark Knight',
    'SpiderMan',
    'Sherlock Holmes',
    'Harry Potter',
    '50 Shades Of Grey',
    'Lord Of The Rings',
    'Minions',
    'Transformers',
    'The Hobits',
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions

    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        color: Color.fromARGB(255, 13, 81, 62),
        icon: const Icon(
          Icons.clear_rounded,
          size: 30,
        ),
      ),
    ];
    throw UnimplementedError();
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      color: Color.fromARGB(255, 13, 81, 62),
      icon: const Icon(
        Icons.arrow_back,
        size: 30,
      ),
    );
    throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    List<String> matchQuery = [];
    for (var movies in searchTerms) {
      if (movies.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(movies);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          contentPadding: const EdgeInsets.fromLTRB(20, 5, 5, 5),
          title: Text(result),
        );
      },
    );
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    List<String> matchQuery = [];
    for (var movies in searchTerms) {
      if (movies.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(movies);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
    throw UnimplementedError();
  }
}
