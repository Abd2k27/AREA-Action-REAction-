import 'package:http/http.dart' as http;

class RegisterModel {
  Future register(String username, String email, String password) async {
    var url = Uri.parse('https://area-backend-api.herokuapp.com/auth/register');
    try {
      var response = await http.post(url, body: {
        'username': username,
        'email': email,
        'password': password,
        'date': DateTime.now().toString()
      });
      print('Response status: ${response.statusCode}');
      print(response.body.runtimeType);
      var body = response.body.split(',');
      var mail = body[1].split(':')[1].split('"')[1];
      var name = body[0].split(':')[1].split('"')[1];
      var passw = body[3].split(':')[1].split('"')[1];
      return {
        "username": name,
        "mail": mail,
        "pass": passw
      };
    } catch (e) {
      print(e);
      return (false);
    }
  }
}
