import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class GithubModel {
  Future github() async {
    const url = 'https://area-backend-api.herokuapp.com/auth/github';
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: true, forceWebView: true);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future githubUserInfo(String username) async {
    var url = Uri.parse(
        'https://area-backend-api.herokuapp.com/services/github/infos');
    try {
      var response = await http.post(url, body: {
        'username': username,
      });
      var body = response.body.split(',');
      print(body);
      var name = body[0].split(':')[1];
      print(name);
      var bio = body[5].split(':')[1];
      print(bio);
      var repos = body[8].split(':')[1];
      print(repos);
      var followers = body[9].split(':')[1];
      print(followers);
      var following = body[10].split(':')[1].split('}')[0];
      print(following);
      return {
        "name": name,
        "bio": bio,
        "repos": repos,
        "followers": followers,
        "following": following,
      };
    } catch (e) {
      print(e);
      return (false);
    }
  }

  Future githubIssues(String username, String repo) async {
    var url = Uri.parse(
        'https://area-backend-api.herokuapp.com/services/github/issues');
    try {
      var response = await http.post(url, body: {
        'username': username,
        'repo': repo,
      });
      var result = response.body;
      print(result.runtimeType);
      return (result);
    } catch (e) {
      print(e);
      return (false);
    }
  }

  Future githubCommits(String username, String repo) async {
    var url = Uri.parse(
        'https://area-backend-api.herokuapp.com/services/github/commits');
    try {
      var response = await http.post(url, body: {
        'username': username,
        'repo': repo,
      });
      var result = response.body;
      print(result.runtimeType);
      return (result);
    } catch (e) {
      print(e);
      return (false);
    }
  }

  Future githubRepos(String username) async {
    var url = Uri.parse(
        'https://area-backend-api.herokuapp.com/services/github/repos');
    try {
      var response = await http.post(url, body: {
        'username': username,
      });
      var result = response.body;
      print(result);
      return (result);
    } catch (e) {
      print(e);
      return (false);
    }
  }
}
