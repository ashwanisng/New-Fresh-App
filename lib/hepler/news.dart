import 'dart:convert';

import 'package:news_fresh/models/articel_model.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticelModel> news = [];

  String url =
      'https://newsapi.org/v2/top-headlines?country=in&apiKey=your_key';

  Future<dynamic> getNews() async {
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ArticelModel articelModel = ArticelModel(
            content: element['content'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            title: element['title'],
            url: element['url'],
          );
          news.add(articelModel);
        }
      });
    }
  }
}
