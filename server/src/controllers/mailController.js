const axios = require("axios");
const cron = require('node-cron');

const envs = require("../config/config");
const transporter = require("../config/mail");
const User = require("../models/userModel");

const weather_mail = async(req, res) => {
  const api = {
    key: envs.weatherApiKey,
    base: "https://api.openweathermap.org/data/2.5/",
    method: 'q'
  }
  const user = await User.findOne({username: req.body.username})

  axios.post(`${api.base}weather?${api.method}=${req.body.location}&APPID=${api.key}&units=metric`)
    .then((result) => {
      var data = result.data;
      const weather_icon =  "http://openweathermap.org/img/wn/" + data.weather[0].icon + "@2x.png"
      const weather_html = "The weather of the city of " + req.body.location + " will be characterized today by " +
        data.weather[0].description + "<img src=`"+ weather_icon + "` width='100' height='100' align='center' />" + " with the following specificities :<br>" +
        "Temperature : " + data.main.temp + "<br>" +
        "Minimum Temperature : " + data.main.temp_min + "<br>" +
        "Maximum Temperature : " + data.main.temp_max + "<br>" +
        "Pressure : " + data.main.pressure + "<br>" +
        "Humidity : " + data.main.humidity + "<br>";
      const weather_message = "Your daily weather report\n"
      const weather_standard = ['"AREA" <hamidtessilimi@gmail.com>', user.email, "Weather", weather_message ]

      transporter.sendMail({
        from: weather_standard[0],
        to: weather_standard[1],
        subject: weather_standard[2],
        text: weather_standard[3],
        html: "<b>" + weather_html + "</b>",
      }).then(info => {
        console.log({info});
      }).catch(console.error);

      cron.schedule("59 8 * * *" , () =>  {
        transporter.sendMail({
          from: weather_standard[0],
          to: weather_standard[1],
          subject: weather_standard[2],
          text: weather_standard[3],
          html: "<b>" + weather_html + "</b>",
        }).then(info => {
          console.log({info});
        }).catch(console.error);
     });
      res.json(data.data)
    })
    .catch((error) => console.log(error))
};

const latest_movies_mail = async(req, res) => {
    const url = "https://api.themoviedb.org/3/movie/latest?api_key=" + envs.moviesApiKey;
    const user = await User.findOne({username: req.body.username});

    axios.get(url)
      .then((data) => {
        const last_movie = data.data;
        const movies = "The last movie actually is :\nTitle : " + last_movie.original_title +
          "\nImage : " + "<img src=`"+ "https://image.tmdb.org/t/p/w92" + last_movie.poster_path + "` width='100' height='100' align='center' />" +
          "\nOriginal language : " + last_movie.original_language +
          "\nOverview : " + last_movie.overview +
          "\nPopularity : " + last_movie.popularity
        const message = "The last movie actually\n" + movies
        const movies_standard_one = ['"AREA" <area@gmail.com>', user.email, "The last movie", message ]

        transporter.sendMail({
          from: movies_standard_one[0],
          to: movies_standard_one[1],
          subject: movies_standard_one[2],
          text: movies_standard_one[3],
          html: "<b>" + movies.split("\n").join("<br>") + "</b>",
        }).then(info => {
          console.log({info});
        }).catch(console.error);

        cron.schedule("59 19 * * *" , () =>  {
          transporter.sendMail({
            from: movies_standard_one[0],
            to: movies_standard_one[1],
            subject: movies_standard_one[2],
            text: movies_standard_one[3],
            html: "<b>" + movies.split("\n").join("<br>") + "</b>",
          }).then(info => {
            console.log({info});
          }).catch(console.error);
        });
        res.json(data.data)
      })
      .catch((error) => console.log(error))
};

function one_movies(tab) {
    var str = "\n\nTitle : " + tab.title + "\nRelease Date : " + tab.release_date +
      "\nImage : " + "<img src=`"+ "https://image.tmdb.org/t/p/w92" + tab.poster_path + "` width='100' height='100' align='center' />"+
      "\nOverview : " + tab.overview
    return str;
}

function concat_movies(all) {
    var res = "This is a list of the top rated movies of the moment :"
    var nb = 0;
    if (all.length > 10)
      nb = 10
    else
      nb = all.length

    for (var i= 0; i < nb ; i++)
      res += one_movies(all[i])
    return res;
}

const top_movies_mail = async(req, res) => {
    const url = "https://api.themoviedb.org/3/movie/popular?api_key=" + envs.moviesApiKey
    const user = await User.findOne({username: req.body.username});

    console.log(user)

    axios.get(url)
      .then((data) => {
        const movie = concat_movies(data.data.results)
        const message = "A list of Top rated movies of the moment :\n" + movie
        const movies_standard_two = ['"AREA" <area@gmail.com>', user.email , "Top rated movies of moments", message ]

        transporter.sendMail({
          from: movies_standard_two[0],
          to: movies_standard_two[1],
          subject: movies_standard_two[2],
          html: "<b>" + movie.split("\n").join("<br>") + "</b>",
        }).then(info => {
          console.log({info});
        }).catch(console.error);

        cron.schedule("59 19 * * 6" , () =>  {
          transporter.sendMail({
            from: movies_standard_two[0],
            to: movies_standard_two[1],
            subject: movies_standard_two[2],
            html: "<b>" + movie.split("\n").join("<br>") + "</b>",
          }).then(info => {
            console.log({info});
          }).catch(console.error);
        });
        res.json(data.data)
      })
      .catch((error) => console.log(error))
};

function one_news(tab) {
  var str = "\n\nTitle : " + tab.title + "\nDescription : " + tab.description + "\nContent : " + tab.content + 
  "\nLink : " + tab.url + "\nImage : " + "<img src=`"+ tab.urlToImage + "` width='70' height='70' align='center' />" +
  "\nSource : " + tab.source.name + "\n :Authors : " + tab.author +
  "\nRelease Date : " + tab.publishedAt
  return str;
}

function concat_news(all) {
  var res = "Your top 10 news of the moment :"
  var nb = 0;
    if (all.length > 10)
      nb = 10
    else
      nb = all.length

    for (var i= 0; i < nb ; i++)
      res += one_news(all[i])
    return res;
}

const top_news_mail = async(req, res) => {
  const url = "https://newsapi.org/v2/top-headlines?country=fr&apiKey=" + envs.newsApiKey
  const user = await User.findOne({username: req.body.username});

  axios.get(url)
    .then((data) => {
      const news = concat_news(data.data.articles)
      const message = "Your complete top 10 news:\n" + news
      const news_standard_two = ['"AREA" <area@gmail.com>', user.email, "Top 10 news of moments", message ]

      transporter.sendMail({
        from: news_standard_two[0],
        to: news_standard_two[1],
        subject: news_standard_two[2],
        html: "<b>" + news.split("\n").join("<br>") + "</b>",
      }).then(info => {
        console.log({info});
      }).catch(console.error);

      cron.schedule("59 8 * * *" , () =>  {
        transporter.sendMail({
          from: news_standard_two[0],
          to: news_standard_two[1],
          subject: news_standard_two[2],
          html: "<b>" + news.split("\n").join("<br>") + "</b>",
        }).then(info => {
          console.log({info});
        }).catch(console.error);
      });

      res.json(data.data)
    })
    .catch((error) => console.log(error))
};

function concat_wordnews(all) {
  var res = "Your top 10 news by keyword of the moment :"
  var nb = 0;
    if (all.length > 10)
      nb = 10
    else
      nb = all.length

    for (var i= 0; i < nb ; i++)
      res += one_news(all[i])
    return res;
}

const top_headlines_mail = async (req, res) => {
  const url = "https://newsapi.org/v2/everything?q=" + req.body.word + "&sortBy=publishedAt&apiKey=" + envs.newsApiKey
  const user = await User.findOne({username: req.body.username});

  axios.get(url)
    .then((data) => {
      const news = concat_wordnews(data.data.articles)
      const message = "Your complete top 10 news by keyword:\n" + news
      const news_standard_two = ['"AREA" <area@gmail.com>', user.email, "Top 10 news of moments by keyword", message ]

      transporter.sendMail({
        from: news_standard_two[0],
        to: news_standard_two[1],
        subject: news_standard_two[2],
        html: "<b>" + news.split("\n").join("<br>") + "</b>",
      }).then(info => {
        console.log({info});
      }).catch(console.error);

      cron.schedule("59 8 * * *" , () =>  {
        transporter.sendMail({
          from: news_standard_two[0],
          to: news_standard_two[1],
          subject: news_standard_two[2],
          html: "<b>" + news.split("\n").join("<br>") + "</b>",
        }).then(info => {
          console.log({info});
        }).catch(console.error);
      });

      res.json(data.data)
    })
    .catch((error) => console.log(error))
};

function one_quote(tab) {
  var str = "\n\nAuthor : " + tab.author + "\nQuote : " + tab.en + "\n";
  return str;
}

function concat_quotes(all) {
  var res = ""
  var nb = 0;
    if (all.length > 5)
      nb = 5
    else
      nb = all.length

    for (var i= 0; i < nb ; i++)
      res += one_quote(all[i])
    return res;
}

const get_quotes_mail = async(req, res) => {
  const url = "https://area-backend-api.herokuapp.com/services/quotes";
  const user = await User.findOne({username: req.body.username});

  axios.get(url)
    .then((data) => {
      const quotes = concat_quotes(data.data);
      const message = "Your 5 quotes of the day are " + quotes
      const news_standard_two = ['"AREA" <area@gmail.com>', user.email, "Top 5 quotes", message ]

      transporter.sendMail({
        from: news_standard_two[0],
        to: news_standard_two[1],
        subject: news_standard_two[2],
        html: "<b>" + quotes.split("\n").join("<br>") + "</b>",
      }).then(info => {
        console.log({info});
      }).catch(console.error);

      cron.schedule("59 8 * * *" , () =>  {
        transporter.sendMail({
          from: news_standard_two[0],
          to: news_standard_two[1],
          subject: news_standard_two[2],
          html: "<b>" + quotes.split("\n").join("<br>") + "</b>",
        }).then(info => {
          console.log({info});
        }).catch(console.error);
      });
      res.json(data.data)

    })
    .catch((error) => console.log(error))
};

const image_mail = async (req, res) => {
  const url = `https://area-backend-api.herokuapp.com/services/image/random`;
  const user = await User.findOne({username: req.body.username});

  axios.post(url, {
    width: req.body.width,
    height: req.body.height
  })
  .then((data) => {
    const result = "<img src=`"+ data.data + "` width='1080' height='400' align='center' />"
    const image_html = result + "\n\n\nEnjoy it\n"
    const image_message = "Your daily background image\n"
    const image_standard = ['"AREA" <hamidtessilimi@gmail.com>', user.email, "Today background image", image_message ]

    transporter.sendMail({
      from: image_standard[0],
      to: image_standard[1],
      subject: image_standard[2],
      text: image_standard[3],
      html: "<b>" + image_html + "</b>",
    }).then(info => {
      console.log({info});
    }).catch(console.error);

    cron.schedule("59 8 * * *" , () =>  {
      transporter.sendMail({
        from: image_standard[0],
        to: image_standard[1],
        subject: image_standard[2],
        text: image_standard[3],
        html: "<b>" + image_html + "</b>",
      }).then(info => {
        console.log({info});
      }).catch(console.error);
   });
    res.json(result);
  })
  .catch((error) => console.log(error))
};

module.exports = { weather_mail, top_movies_mail, latest_movies_mail, top_headlines_mail, top_news_mail, get_quotes_mail, image_mail };