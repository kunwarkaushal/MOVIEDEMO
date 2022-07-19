// import 'package:http/http.dart' as http;
// import 'package:show_app/models/topmovies.dart';

// class MoviesRemoteService {
//   Future<List<Welcome>?> getMoviesDetail() async {
//     var client = http.Client();
//     var uri = Uri.parse(
//         "https://api.themoviedb.org/3/movie/top_rated?api_key=27fe8aa285e6d11c8b3cf5fa638758e9&language=en-US&page=2");
//     var response = await client.get(uri);
//     if (response.statusCode == 200) {
//       var json = response.body;
//       return welcomeFromJson(json);
//     }
//   }
// }
import 'dart:convert';
import 'package:http/http.dart' as http;
import '/models/topmovies.dart';

class MoviesRemoteService {
  String url =
      "https://api.themoviedb.org/3/movie/top_rated?api_key=27fe8aa285e6d11c8b3cf5fa638758e9&language=en-US&page=1";
  Future<Movies> getMovieDetail() async {
    var movieList;
    var response = await http.get(Uri.parse(url));
    // print(response.body);
    var stores = json.decode(response.body);
    int len = stores.length;
    print('length = $len');
    if (response.statusCode == 200) {
      var data = response.body;
      var jsonMap = jsonDecode(data); //decode the model file
      // print(movieList);
      movieList = Movies.fromJson(jsonMap);
    }
    return movieList;
  }
}
