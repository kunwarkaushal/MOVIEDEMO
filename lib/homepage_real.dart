import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'bookmark.dart';
import 'models/topmovies.dart';
import 'services/movies_remote_service.dart';

// import 'package:flutter/cupertino.dart';

class HomePageNew extends StatefulWidget {
  const HomePageNew({Key? key}) : super(key: key);
  @override
  State<HomePageNew> createState() => _HomePageNewState();
}

class _HomePageNewState extends State<HomePageNew> {
  Future<Movies>? movieData;
  Future<Movies> getList() async {
    MoviesRemoteService moviesRemoteService = MoviesRemoteService();
    var movies = await moviesRemoteService.getMovieDetail();
    return movies;
  }

  @override
  void initState() {
    // TODO: implement initState
    movieData = getList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    var _height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xff1A6350),
      appBar: AppBar(
        elevation: 0.0,
        toolbarHeight: 60,
        backgroundColor: Colors.transparent,

        title: Text('Home'),
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
        child: Column(
          children: [
            Container(
              height: _height,
              width: _width,
              child: Stack(
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    width: _width,
                    height: _height,
                    decoration: BoxDecoration(
                      gradient: RadialGradient(
                        colors: [
                          Color.fromARGB(255, 45, 170, 136),
                          Color.fromARGB(255, 26, 99, 80),
                          Color.fromARGB(255, 9, 34, 27),
                        ],
                        radius: 1.0,
                        focalRadius: 10,
                      ),
                      boxShadow: [
                        BoxShadow(blurRadius: 2),
                      ],
                    ),
                  ),
                  Align(
                    alignment: FractionalOffset(0.1, 0.02),
                    child: Text(
                      'Trending Movies',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Align(
                    alignment: FractionalOffset(0.0, 0.14),
                    child: Container(
                      width: _width,
                      height: 225,
                      color: Color.fromARGB(80, 45, 170, 137),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: ListView.builder(
                          itemCount: 4,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.fromLTRB(10, 3, 15, 3),
                              padding: const EdgeInsets.all(6),
                              height: 215,
                              width: 120,
                              color: Colors.transparent,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    width: 120,
                                    height: 160,
                                    decoration: BoxDecoration(
                                      color: Colors.blueGrey.shade400,
                                      borderRadius: BorderRadius.circular(5),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color.fromARGB(40, 0, 0, 0),
                                          blurRadius: 10,
                                          spreadRadius: 2,
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 3, 10, 0),
                                    child: Text(
                                      'The Movies Name',
                                      textAlign: TextAlign.center,
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: FractionalOffset(0.1, 0.55),
                    child: Text(
                      'Trending TV Series',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Align(
                    alignment: FractionalOffset(0.0, 1.0),
                    child: Container(
                      width: _width,
                      height: 225,
                      color: Color.fromARGB(80, 45, 170, 137),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: ListView.builder(
                          itemCount: 4,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.fromLTRB(10, 3, 15, 3),
                              padding: const EdgeInsets.all(6),
                              height: 215,
                              width: 120,
                              color: Colors.transparent,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    width: 120,
                                    height: 160,
                                    decoration: BoxDecoration(
                                      color: Colors.blueGrey.shade200,
                                      borderRadius: BorderRadius.circular(5),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color.fromARGB(40, 0, 0, 0),
                                          blurRadius: 10,
                                          spreadRadius: 2,
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 3, 10, 0),
                                    child: Text(
                                      'TV Series Name',
                                      textAlign: TextAlign.center,
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: _width,
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Column(
                children: [
                  Text(
                    'Trending Movies',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    width: _width,
                    height: 225,
                    color: Color.fromARGB(80, 45, 170, 137),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: ListView.builder(
                        itemCount: 4,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.fromLTRB(10, 3, 15, 3),
                            padding: const EdgeInsets.all(6),
                            height: 215,
                            width: 120,
                            color: Colors.transparent,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  width: 120,
                                  height: 160,
                                  decoration: BoxDecoration(
                                    color: Colors.blueGrey.shade200,
                                    borderRadius: BorderRadius.circular(5),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color.fromARGB(40, 0, 0, 0),
                                        blurRadius: 10,
                                        spreadRadius: 2,
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 3, 10, 0),
                                  child: Text(
                                    'TV Series Name',
                                    textAlign: TextAlign.center,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
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

class MovieFile extends StatefulWidget {
  MovieFile({required this.movieData, required this.items});

  var items;

  final Future<Movies>? movieData;

  @override
  State<MovieFile> createState() => _MovieFileState();
}

class _MovieFileState extends State<MovieFile> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Movies>(
      future: widget.movieData, //future ma moviees ko data halni
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(10, 3, 15, 3),
                padding: const EdgeInsets.all(6),
                height: 215,
                width: 120,
                color: Colors.transparent,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    //container here is strong
                    Container(
                      width: 120,
                      height: 160,
                      child: Image(
                        image: NetworkImage(
                            "https://image.tmdb.org/t/p/w500/${snapshot.data!.results[widget.items].posterPath}"),
                        height: 120,
                        width: 160,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blueGrey.shade400,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(40, 0, 0, 0),
                            blurRadius: 10,
                            spreadRadius: 2,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 3, 10, 0),
                      child: Text(
                        '${snapshot.data!.results[widget.items].originalTitle}',
                        textAlign: TextAlign.center,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                "${snapshot.data!.results[widget.items].originalTitle}",
                style: TextStyle(
                  color: Color.fromARGB(255, 69, 119, 184),
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              Container(
                child:
                    Text("${snapshot.data!.results[widget.items].releaseDate}"),
                color: Colors.red[50],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Row(
                  children: [
                    Image(
                      image: NetworkImage(
                          "https://image.tmdb.org/t/p/w500/${snapshot.data!.results[widget.items].posterPath}"),
                      height: 600,
                      width: 300,
                    ),
                    SizedBox(
                      width: 30,
                    ),

                  ],
                ),
              ),
              Text(
                "Description",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Text(
                "${snapshot.data!.results[widget.items].overview}",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ],
          );
        }
        return LinearProgressIndicator();
      },
    );
  }
}
