import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class NewsModel {
  Future<List<dynamic>> topNews() async {
    var url = Uri.parse('https://area-backend-api.herokuapp.com/services/news/top_news');
    try {
      var response = await http.get(url);
      print(response.body.runtimeType);
      var love = jsonDecode(response.body) as List;
      int i = 0;
      love = love.take(20).toList();
      for (var elt in love) {
        print('$i........' + elt.toString());
        i++;
      }
      print(love.runtimeType);
      return (love);
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<List<dynamic>>  getNews(String word) async {
    var url = Uri.parse('https://area-backend-api.herokuapp.com/services/news/by_word');
    try {
      var response = await http.post(url, body: {
        'word': word,
      });
      print(response.body.runtimeType);
      var love = jsonDecode(response.body) as List;
      int i = 0;
      love = love.take(20).toList();
      for (var elt in love) {
        print('$i........' + elt.toString());
        i++;
      }
      print(love.runtimeType);
      return (love);
    } catch (e) {
      print(e);
      throw e;
    }
  }
}
