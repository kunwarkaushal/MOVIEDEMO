import 'package:flutter/material.dart';
import 'package:demoproject/pages/trending_page.dart';
import '/models/trending.dart';
import 'package:demoproject/page_bookmark.dart';

class TrendingTiles extends StatefulWidget {
  TrendingTiles({required this.movieData, required this.items});

  var items;

  final Future<Trending>? movieData;

  @override
  State<TrendingTiles> createState() => _TrendingTilesState();
}

class _TrendingTilesState extends State<TrendingTiles> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Trending>(
      future: widget.movieData, //future ma moviees ko data halni
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => TrendingPage(
                          itemIndex: widget.items,
                        )),
              );
            },
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                  child: Row(
                    children: [
                      Image(
                        image: NetworkImage(
                            "https://image.tmdb.org/t/p/w500/${snapshot.data!.results![widget.items].posterPath}"),
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
                    "${snapshot.data!.results![widget.items].originalTitle}",
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
              ],
            ),
          );
        }
        throw 'Data Not Available';
      },
    );
  }
}
