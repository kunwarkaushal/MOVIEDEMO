import 'package:flutter/material.dart';
import '/services/movies_remote_service.dart';
import '/models/topmovies.dart';
import '/tiles/movietiles.dart';
class MovieScreen extends StatefulWidget {
  @override
  State<MovieScreen> createState() => _MovieScreenState();
}
class _MovieScreenState extends State<MovieScreen> {
  bool isLoaded = false;
  Future<Movies>? movieData;
  Future<Movies> getList() async {
    MoviesRemoteService moviesRemoteService = MoviesRemoteService();
    var movies = await moviesRemoteService.getMovieDetail();
    getData(movieData);
    return movies;
  }
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
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Bookmark'),
          backgroundColor: Colors.blueAccent,
        ),

        body: Visibility(
          visible: isLoaded,
          child: SingleChildScrollView(
          child: SafeArea(
              child: Column(
                children: [

                  Container(
                    height: 350,
                    width: 500,
                    color: Colors.blueGrey.withOpacity(0.2),
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
                ],
              ),
            ),
          ),
          replacement: const Center(
            child: CircularProgressIndicator(
              color: Color.fromARGB(255, 13, 81, 62),
              backgroundColor: Color.fromARGB(255, 61, 164, 135),
            ),
          ),
        ),
      ),
    );
  }
}


