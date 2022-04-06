const axios = require("axios");

const User = require("../models/userModel");
const envs = require("../config/config");

const getVideoInfos = async(req, res) => {
  var url = "https://youtube.googleapis.com/youtube/v3/search?part=snippet&maxResults=1&q=" + req.body.word + "&type=video&key=" + envs.youtubeApiKey

  axios.get(url)
    .then((data) => {
      res.json(data.data.items)
      var message = "Your " + req.body.word + " video coming from " + data.data.items[0].snippet.channelTitle + " channel ;) !!!\nEnjoy your video: " +
      data.data.items[0].snippet.thumbnails.high.url + "\nhttps://www.youtube.com/watch?v=" + data.data.items[0].id.videoId
    })
    .catch((error) => console.log(error))
};

const getChannelInfos = async(req, res) => {
  var url = "https://youtube.googleapis.com/youtube/v3/search?part=snippet&maxResults=1&q=" + req.body.word + "&type=channel&key=" + envs.youtubeApiKey
  var channelid = ""

  axios.get(url)
    .then((data) => {
      channelid = data.data.items[0].id.channelId
      var urla = "https://youtube.googleapis.com/youtube/v3/channels?part=snippet,contentDetails,statistics,status&id=" + channelid + "&key=" + envs.youtubeApiKey

      axios.get(urla)
      .then((data) => {
        res.json(data.data.items)
        var message = "The " + req.body.word + " channel " + data.data.items[0].snippet.title + " ;) !!!\n" +
        data.data.items[0].snippet.thumbnails.high.url + " have " + data.data.items[0].statistics.videoCount + " videos " +
        data.data.items[0].statistics.viewCount + " views and " + data.data.items[0].statistics.subscriberCount + " suscribers !!!"
      })
      .catch((error) => console.log(error))
    })
    .catch((error) => console.log(error))
  
};

const lastVideo = async(req, res) => {
  var url = "https://youtube.googleapis.com/youtube/v3/search?part=snippet&maxResults=1&q=" + req.body.word + "&type=channel&key=" + envs.youtubeApiKey
  var channelid = ""

  axios.get(url)
    .then((data) => {
      channelid = data.data.items[0].id.channelId
      var urla = "https://youtube.googleapis.com/youtube/v3/activities?part=snippet%2CcontentDetails&channelId=" + channelid + "&maxResults=1&key=" + envs.youtubeApiKey

      axios.get(urla)
      .then((data) => {
        res.json(data.data.items)
        var message = "The last video upload by your channel is " +
        data.data.items[0].snippet.title + ".\n" + data.data.items[0].snippet.thumbnails.high.url + "\nvideo url: " +
        "https://www.youtube.com/watch?v=" + data.data.items[0].contentDetails.upload.videoId + "\nPublished at " + 
        data.data.items[0].snippet.publishedAt
      })
      .catch((error) => console.log(error))
    })
    .catch((error) => console.log(error))
};

const likeYoutube = async (req, res) => {
    var url = "https://youtube.googleapis.com/youtube/v3/search?part=snippet&maxResults=1&q=" + req.body.word + "&type=video&key=" + envs.youtubeApiKey
    var videoid = ""
    var videolink = ""

    const user = await User.findOne({username: req.body.username});
    var val = user.services_data.filter(student => student.get("name") == 'google');

    var config = {
        headers: {
            'Authorization': "Bearer " + val[0].get("accessToken"),
        }
    }

    await axios.get(url)
    .then((data) => {
      videoid = data.data.items[0].id.videoId
      videolink = "https://www.youtube.com/watch?v=" + videoid

      axios.post('https://www.googleapis.com/youtube/v3/videos/rate?id='+ videoid +'&rating=like', {}, config)
      .then((data) => {
        res.json({
          "videoLink": videolink
        })
      })
      .catch((error) => console.log(error))
    })
    .catch((error) => console.log(error))
};

const dislikeYoutube = async (req, res) => {
    var url = "https://youtube.googleapis.com/youtube/v3/search?part=snippet&maxResults=1&q=" + req.body.word + "&type=video&key=" + envs.youtubeApiKey
    var videoid = ""
    var videolink = ""

    const user = await User.findOne({username: req.body.username});
    var val = user.services_data.filter(student => student.get("name") == 'google');

    var config = {
        headers: {
            'Authorization': "Bearer " + val[0].get("accessToken"),
        }
    }

    axios.get(url)
    .then((data) => {
      videoid = data.data.items[0].id.videoId
      videolink = "https://www.youtube.com/watch?v=" + videoid

      axios.post('https://www.googleapis.com/youtube/v3/videos/rate?id='+ videoid +'&rating=dislike', {}, config)
      .then((data) => {
        res.json({
          "videolink": videolink
        })
      })
      .catch((error) => console.log(error))
    })
    .catch((error) => console.log(error))
}

const commentYoutube = async (req, res) => {
    var url = "https://youtube.googleapis.com/youtube/v3/search?part=snippet&maxResults=1&q=" + req.body.word + "&type=video&key=" + envs.youtubeApiKey
    var videoid = ""
    var videolink = ""

    const user = await User.findOne({username: req.body.username});
    var val = user.services_data.filter(student => student.get("name") == 'google');

    var config = {
      headers: {
        'Authorization': "Bearer " + val[0].get("accessToken")
      }
    }

    await axios.get(url)
      .then(async (data) => {
        videoid = data.data.items[0].id.videoId
        videolink = "https://www.youtube.com/watch?v=" + videoid
      })
      .catch((error) => console.log(error))

    await axios.post('https://youtube.googleapis.com/youtube/v3/commentThreads?part=snippet&key=' + envs.youtubeApiKey, {
        "snippet": {
          "videoId": videoid,
          "topLevelComment": {
            "snippet": {
              "textOriginal": req.body.comment
            }
          }
        }
      }, config)
      .then((data) => {
        res.json(data.data)
      })
      .catch((error) => console.log(error))
}

module.exports = { getVideoInfos, getChannelInfos, lastVideo, likeYoutube, dislikeYoutube, commentYoutube };