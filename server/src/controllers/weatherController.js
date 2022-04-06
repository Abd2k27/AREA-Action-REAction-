const axios = require("axios");

const envs = require("../config/config");

const getWeather = async(req, res) => {
  const api = {
    key: envs.weatherApiKey,
    base: "https://api.openweathermap.org/data/2.5/",
    method: 'q'
  }

  axios.post(`${api.base}weather?${api.method}=${req.body.location}&APPID=${api.key}&units=metric`)
    .then((data) => res.json(data.data))
    .catch((error) => console.log(error))
};

module.exports = { getWeather };