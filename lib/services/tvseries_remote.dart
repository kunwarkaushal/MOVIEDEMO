import 'dart:convert';
import 'package:http/http.dart' as http;
import '/models/tvseries.dart';

class TVSeriesRemoteService {
  String url =
      "https://api.themoviedb.org/3/tv/popular?api_key=2060fb79a74a7ad038d3947166368ae9&language=en-US&page=1";
  Future<TVSeries> getMovieDetail() async {
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
      movieList = TVSeries.fromJson(jsonMap);
    }
    return movieList;
  }
}
