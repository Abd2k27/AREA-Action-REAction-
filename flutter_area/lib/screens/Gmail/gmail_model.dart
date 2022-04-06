import 'package:http/http.dart' as http;

class MailModel {
  Future topMoviesMail(String username) async {
    var url = Uri.parse('https://area-backend-api.herokuapp.com/services/mail/top_movies');
    try {
      var response = await http.post(url, body: {
        'username': username,
      });
      var result = response.body;
      return (result);
    } catch (e) {
      print(e);
      return (false);
    }
  }

  Future weatherMail(String username, String location) async {
    var url = Uri.parse('https://area-backend-api.herokuapp.com/services/mail/weather');
    try {
      var response = await http.post(url, body: {
        'username': username,
        'location': location,
      });
      var result = response.body;
      return (result);
    } catch (e) {
      print(e);
      return (false);
    }
  }

  Future topNewsMail(String username) async {
    var url = Uri.parse('https://area-backend-api.herokuapp.com/services/mail/top_news');
    try {
      var response = await http.post(url, body: {
        'username': username,
      });
      print(username);
      var result = response.body;
      return (result);
    } catch (e) {
      print(e);
      return (false);
    }
  }

  Future latestMoviesMail(String username) async {
    var url = Uri.parse('https://area-backend-api.herokuapp.com/services/mail/latest_movies');
    try {
      var response = await http.post(url, body: {
        'username': username,
      });
      print(username);
      var result = response.body;
      return (result);
    } catch (e) {
      print(e);
      return (false);
    }
  }

  Future topHeadlinesNewsMail(String username, String word) async {
    var url = Uri.parse('https://area-backend-api.herokuapp.com/services/mail/top_headlines');
    try {
      var response = await http.post(url, body: {
        'username': username,
        'word': word,
      });
      var result = response.body;
      return (result);
    } catch (e) {
      print(e);
      return (false);
    }
  }

  Future quotesMail(String username) async {
    var url = Uri.parse('https://area-backend-api.herokuapp.com/ervices/mail/quotes');
    try {
      var response = await http.post(url, body: {
        'username': username,
      });
      var result = response.body;
      return (result);
    } catch (e) {
      print(e);
      return (false);
    }
  }

  Future imageMail(String username) async {
    var url = Uri.parse('https://area-backend-api.herokuapp.com/services/mail/image');
    try {
      var response = await http.post(url, body: {
        'username': username,
        'width': '800',
        'height': '280',
      });
      var result = response.body;
      return (result);
    } catch (e) {
      print(e);
      return (false);
    }
  }
}
