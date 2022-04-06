import 'package:http/http.dart' as http;

class LoginModel {
  Future login(String username, String password) async {
    var url = Uri.parse('https://area-backend-api.herokuapp.com/auth/login');
    try {
      var response = await http.post(url, body: {
        'username': username,
        'password': password,
      });
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      print(response.body.runtimeType);
      var body = response.body.split(',');
      var name = body[1].split(':')[1].split('"')[1];
      var passw = body[4].split(':')[1].split('"')[1];
      return {
        "username": name,
        "pass": passw
      };
    } catch (e) {
      print(e);
      return (false);
    }
  }
}
