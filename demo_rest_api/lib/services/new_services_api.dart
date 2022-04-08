import 'package:dio/dio.dart';

import '../models/NewsReponse.dart';

class NewsApiServices {
  static String _apiKey = "4ab519017868450abc47ccc1604f9cd2";
  String _url =
      "https://newsapi.org/v2/everything?q=Apple&from=2022-04-08&sortBy=popularity&apiKey=4ab519017868450abc47ccc1604f9cd2";
  Dio _dio =  Dio();

  NewsApiServices() {
    _dio = Dio();
  }

  Future<List<Articles>?> fetchNewsArticle() async {
      Response response = await _dio.get(_url);
      print(response.data["articles"]);
      NewsResponse newsResponse = NewsResponse.fromJson(response.data);
      print("hello");
      return newsResponse.articles;
  }
}
