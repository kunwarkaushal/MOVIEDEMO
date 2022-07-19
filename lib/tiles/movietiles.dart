import 'package:flutter/material.dart';
import '/models/topmovies.dart';
import 'package:demoproject/page_bookmark.dart';

class MovieTiles extends StatefulWidget {
  MovieTiles({required this.movieData, required this.items});

  var items;

  final Future<Movies>? movieData;

  @override
  State<MovieTiles> createState() => _MovieTilesState();
}

class _MovieTilesState extends State<MovieTiles> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Movies>(
      future: widget.movieData, //future ma moviees ko data halni
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PageBookmark(
                          itemIndex: widget.items,
                        )),
              );
            },
            child: Container(
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                  child: Row(
                    children: [
                      Image(
                        image: NetworkImage(
                            "https://image.tmdb.org/t/p/w500/${snapshot.data!.results[widget.items].posterPath}"),
                        height: 200,
                        width: 155,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 60,
                  width: 155,
                  child: Text(
                    "${snapshot.data!.results[widget.items].title}",
                    textAlign: TextAlign.center,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ]),
            ),
          );
        }
        throw 'Data Not Available';
      },
    );
  }
}
