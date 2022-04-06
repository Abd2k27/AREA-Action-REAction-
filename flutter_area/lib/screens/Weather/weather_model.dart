import 'package:http/http.dart' as http;

class WeatherModel {
  Future cityWeather(String city) async {
    var url = Uri.parse('https://area-backend-api.herokuapp.com/services/weather');
    try {
      var response = await http.post(url, body: {
        'location': city,
      });
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      print(response.body.runtimeType);
      var body = response.body.split(',');
      print(body);
      var locate = body[body.length - 2].split(':')[1].split('"')[1];
      var temp = body[7].split(':')[2];
      var humid = body[12].split(':')[1].split('}')[0];
      return {
        "locate": locate,
        "temp": temp,
        "humidity": humid
      };
    } catch (e) {
      print(e);
      return (false);
    }
  }
}
