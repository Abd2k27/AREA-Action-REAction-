import 'package:http/http.dart' as http;

class MovieModel {
  Future lastMovie() async {
    var url = Uri.parse('https://area-backend-api.herokuapp.com/services/movies/latest');
    try {
      var response = await http.get(url);
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      print(response.body.runtimeType);
      var result = response.body;
      return (result);
    } catch (e) {
      print(e);
      return (false);
    }
  }

  Future infoMovie(String movie_name) async {
    var url = Uri.parse('https://area-backend-api.herokuapp.com/services/movies/infos');
    try {
      var response = await http.post(url, body: {
        'movie_name': movie_name,
      } );
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      print(response.body.runtimeType);
      var result = response.body;
      return (result);
    } catch (e) {
      print(e);
      return (false);
    }
  }

  Future videoMovie() async {
    var url = Uri.parse('https://area-backend-api.herokuapp.com/services/movies/videos');
    try {
      var response = await http.get(url);
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      print(response.body.runtimeType);
      var result = response.body;
      return (result);
    } catch (e) {
      print(e);
      return (false);
    }
  }

  Future topMovie() async {
    var url = Uri.parse('https://area-backend-api.herokuapp.com/services/movies/top');
    try {
      var response = await http.get(url);
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      print(response.body.runtimeType);
      var result = response.body;
      return (result);
    } catch (e) {
      print(e);
      return (false);
    }
  }
}
