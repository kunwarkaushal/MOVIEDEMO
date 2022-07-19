import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:demoproject/models/trending_tvseries.dart';

class TrendingTVSeriesRemoteService {
  String url =
      "https://api.themoviedb.org/3/trending/all/day?api_key=2060fb79a74a7ad038d3947166368ae9&language=en-US&page=1";
  Future<TrendingTVSeries> getMovieDetail() async {
    var tvSeriesList;
    var response = await http.get(Uri.parse(url));
    // print(response.body);
    var stores = json.decode(response.body);
    int len = stores.length;
    print('length = $len');
    if (response.statusCode == 200) {
      var data = response.body;
      var jsonMap = jsonDecode(data); //decode the model file
      // print(tvSeriesList);
      tvSeriesList = TrendingTVSeries.fromJson(jsonMap);
    }
    return tvSeriesList;
  }
}
