import 'package:flutter/material.dart';
import 'package:demoproject/models/trending.dart';
import 'package:demoproject/page_bookmark.dart';
import '../tiles/trendingtiles.dart';
import '/services/trending_remote.dart';
import '/models/topmovies.dart';
import '/models/trending.dart';

class TrendingScreen extends StatefulWidget {
  const TrendingScreen({Key? key}) : super(key: key);
  @override
  State<TrendingScreen> createState() => _TrendingScreenState();
}

class _TrendingScreenState extends State<TrendingScreen> {
  bool isLoaded = false;
  Future<Trending>? movieData;
  Future<Trending> getList() async {
    TrendingRemoteService trendingRemoteService = TrendingRemoteService();
    var movies = await trendingRemoteService.getMovieDetail();
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
        body: Visibility(
          visible: isLoaded,
          child: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  // Container(
                  //   width: MediaQuery.of(context).size.width,
                  //   height: 225,
                  //   color: Color.fromARGB(80, 45, 170, 137),
                  //   child: Padding(
                  //     padding: const EdgeInsets.all(5.0),
                  //     child: ListView.builder(
                  //       itemCount: 4,
                  //       shrinkWrap: true,
                  //       scrollDirection: Axis.horizontal,
                  //       itemBuilder: (context, index) {
                  //         return Container(
                  //           margin: const EdgeInsets.fromLTRB(10, 3, 15, 3),
                  //           padding: const EdgeInsets.all(6),
                  //           height: 215,
                  //           width: 120,
                  //           color: Colors.transparent,
                  //           child: Column(
                  //             mainAxisSize: MainAxisSize.min,
                  //             children: [
                  //               Container(
                  //                 width: 120,
                  //                 height: 160,
                  //                 child: Image(
                  //                   image: NetworkImage(
                  //                       "https://image.tmdb.org/t/p/w500/${snapshot.data!.results[widget.items].posterPath}"),
                  //                   height: 600,
                  //                   width: 300,
                  //                 ),
                  //                 decoration: BoxDecoration(
                  //                   color: Colors.blueGrey.shade400,
                  //                   borderRadius: BorderRadius.circular(5),
                  //                   boxShadow: [
                  //                     BoxShadow(
                  //                       color: Color.fromARGB(40, 0, 0, 0),
                  //                       blurRadius: 10,
                  //                       spreadRadius: 2,
                  //                     )
                  //                   ],
                  //                 ),
                  //               ),
                  //               Padding(
                  //                 padding: const EdgeInsets.fromLTRB(10, 3, 10, 0),
                  //                 child: Text(
                  //                   'The Movies Name',
                  //                   textAlign: TextAlign.center,
                  //                   maxLines: 3,
                  //                   overflow: TextOverflow.ellipsis,
                  //                   style: TextStyle(
                  //                     fontSize: 13,
                  //                     fontWeight: FontWeight.bold,
                  //                     color: Colors.white,
                  //                   ),
                  //                 ),
                  //               ),
                  //             ],
                  //           ),
                  //         );
                  //       },
                  //     ),
                  //   ),
                  // ),

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
                        return TrendingTiles(
                            movieData: movieData, items: index);
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

// class TrendingTiles extends StatefulWidget {
//   TrendingTiles({required this.movieData, required this.items});

//   var items;

//   final Future<Trending>? movieData;

//   @override
//   State<TrendingTiles> createState() => _TrendingTilesState();
// }

// class _TrendingTilesState extends State<TrendingTiles> {
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<Trending>(
//       future: widget.movieData, //future ma moviees ko data halni
//       builder: (BuildContext context, snapshot) {
//         if (snapshot.hasData) {
//           return GestureDetector(
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context) => PageBookmark(
//                           itemIndex: widget.items,
//                         )),
//               );
//             },
//             child: Column(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
//                   child: Row(
//                     children: [
//                       Image(
//                         image: NetworkImage(
//                             "https://image.tmdb.org/t/p/w500/${snapshot.data!.results![widget.items].posterPath}"),
//                         height: 200,
//                         width: 155,
//                       ),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   height: 60,
//                   width: 155,
//                   child: Text(
//                     "${snapshot.data!.results![widget.items].originalTitle}",
//                     textAlign: TextAlign.center,
//                     maxLines: 3,
//                     overflow: TextOverflow.ellipsis,
//                     style: TextStyle(
//                       color: Color.fromARGB(255, 69, 119, 184),
//                       fontWeight: FontWeight.bold,
//                       fontSize: 15,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         }
//         throw 'Data Not Available';
//       },
//     );
//   }
// }
