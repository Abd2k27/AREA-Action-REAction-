import 'package:http/http.dart' as http;

class ImageModel {
  Future randomImage() async {
    var url = Uri.parse('https://area-backend-api.herokuapp.com/services/image/random');
    try {
      var response = await http.post(url, body: {
        'width': '800',
        'height': '280',
      });
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      print(response.body.runtimeType);
      var body = response.body.split('"')[1];
      print(body);
      return (body);
    } catch (e) {
      print(e);
      return (false);
    }
  }
}
