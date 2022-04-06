import 'package:http/http.dart' as http;

class YoutubeModel {
  Future videoInfo(String word) async {
    var url = Uri.parse(
        'https://area-backend-api.herokuapp.com/services/youtube/video_infos');
    try {
      var response = await http.post(url, body: {
        'word': word,
      });
      var body = response.body.split(',');
      print(body);
      var titre = body[6].split(':')[1];
      print(titre);
      var description = body[7].split(':')[1];
      print(description);
      var chaine = body[body.length - 3].split(':')[1];
      print(chaine);
      var date = body[body.length - 1].split(':')[1];
      print(date);
      return {
        "titre": titre,
        "desc": description,
        "chaine": chaine,
        "date": date
      };
    } catch (e) {
      print(e);
      return (false);
    }
  }

  Future channelInfo(String word) async {
    var url = Uri.parse(
        'https://area-backend-api.herokuapp.com/services/youtube/channel_infos');
    try {
      var response = await http.post(url, body: {
        'word': word,
      });
      var body = response.body.split(',');
      print(body);
      var titre = body[15].split(':')[2];
      print(titre);
      var view = body[19].split(':')[2];
      print(view);
      var sub = body[20].split(':')[1];
      print(sub);
      var vid = body[22].split(':')[1].split('}')[0];
      print(vid);
      return {"Title": titre, "view": view, "followers": sub, "vid": vid};
    } catch (e) {
      print(e);
      return (false);
    }
  }

  Future lastVideoInfo(String word) async {
    var url = Uri.parse(
        'https://area-backend-api.herokuapp.com/services/youtube/last_video');
    try {
      var response = await http.post(url, body: {
        'word': word,
      });
      var body = response.body.split(',');
      print(body);
      var titre = body[5].split(':')[1];
      print(titre);
      var desc = body[6].split(':')[1];
      print(desc);
      var date = body[3].split(':')[2];
      print(date);
      return {"Title": titre, "desc": desc, "date": date};
    } catch (e) {
      print(e);
      return (false);
    }
  }

  Future likeVideo(String word, String username) async {
    var url = Uri.parse(
        'https://area-backend-api.herokuapp.com/services/youtube/like_video');
    try {
      var response = await http.post(url, body: {
        'username': username,
        'word': word,
      });
      var result = response.body;
      print(result.runtimeType);
      return (result);
    } catch (e) {
      print(e);
      return (false);
    }
  }

  Future dislikeVideo(String word, String username) async {
    var url = Uri.parse(
        'https://area-backend-api.herokuapp.com/services/youtube/dislike_video');
    try {
      var response = await http.post(url, body: {
        'username': username,
        'word': word,
      });
      print("ok");
      var result = response.body;
      print(result.runtimeType);
      return (result);
    } catch (e) {
      print(e);
      return (false);
    }
  }
}
