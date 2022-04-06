const axios = require("axios");

const envs = require("../config/config");

const getTopNews = async(req, res) => {
  var url = `https://newsapi.org/v2/top-headlines?country=fr&apiKey=${envs.newsApiKey}`;

  axios.get(url)
    .then((data) => res.json(data.data.articles))
    .catch((error) => console.log(error))
};

const getNewsByWord = async (req, res) => {
  var url = `https://newsapi.org/v2/everything?q=${req.body.word}&sortBy=publishedAt&apiKey=${envs.newsApiKey}`;

  axios.get(url)
    .then((data) => res.json(data.data.articles))
    .catch((error) => console.log(error))
};

module.exports = { getTopNews, getNewsByWord };