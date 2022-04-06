import 'package:http/http.dart' as http;

class AccountModel {
  Future update() async {
    var url = Uri.parse('https://area-backend-api.herokuapp.com/auth/users/:id');
    try {
      var response = await http.put(url);
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      print(response.body.runtimeType);
      var body = response.body;
      //var name = body[1].split(':')[1].split('"')[1];
      //var passw = body[4].split(':')[1].split('"')[1];
      return body;
    } catch (e) {
      print(e);
      return (false);
    }
  }
}
