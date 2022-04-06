import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class GoogleModel {
  Future google() async {
    const url = 'https://area-backend-api.herokuapp.com/auth/google';
    if (await canLaunch(url)) {
      var response = await launch(url, forceSafariVC: true, forceWebView: true);
      print(response.runtimeType);
    } else {
      throw 'Could not launch $url';
    }
  }
}
