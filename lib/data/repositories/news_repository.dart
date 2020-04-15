import 'dart:convert';

import 'package:news_app/data/models/news_response.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/utils/constants.dart';

abstract class NewsRepository {
  Future<List<Articles>> getArticles();
}

class ArticleRepository implements NewsRepository {
  @override
  Future<List<Articles>> getArticles() async {
    var response = await http.get(BASE_URL);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      List<Articles> articles = News.fromJson(data).articles;
      return articles;
    } else {
      throw Exception();
    }
  }
}