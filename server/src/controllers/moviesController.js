const axios = require("axios");

const envs = require("../config/config");

const getMoviesDetails = async(req, res) => {
  var url = "https://api.themoviedb.org/3/search/movie/?query=" + req.body.movie_name + "&api_key=" + envs.moviesApiKey

  axios.get(url)
    .then((data) => res.json(data.data.results))
    .catch((error) => console.log(error))
};

const getLatestMovies = async(req, res) => {
  var url = "https://api.themoviedb.org/3/movie/latest?api_key=" + envs.moviesApiKey

  axios.get(url)
    .then((data) => res.json(data.data))
    .catch((error) => console.log(error))
};

const getMovieVideo = async(req, res) => {
  var url = "https://api.themoviedb.org/3/movie/" + req.body.movie_id + "/videos?api_key=" + envs.moviesApiKey

  axios.get(url)
    .then((data) => res.json(data.data))
    .catch((error) => console.log(error))
};

const getTopMovies = async(req, res) => {
  var url = "https://api.themoviedb.org/3/movie/popular?api_key=" + envs.moviesApiKey

  axios.get(url)
    .then((data) => res.json(data.data.results))
    .catch((error) => console.log(error))
};

module.exports = { getMoviesDetails, getLatestMovies, getMovieVideo, getTopMovies };