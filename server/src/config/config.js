const dotenv = require("dotenv").config()

module.exports = {
    weatherApiKey: process.env.WEATHER_API_KEY,
    youtubeApiKey: process.env.YOUTUBE_API_KEY,
    moviesApiKey: process.env.MOVIES_API_KEY,
    newsApiKey: process.env.NEWS_API_KEY,

    google_client_id: process.env.GOOGLE_CLIENT_ID,
    google_client_secret: process.env.GOOGLE_CLIENT_SECRET,
    google_callback_url: process.env.GOOGLE_CALLBACK_URL,

    github_client_id: process.env.GITHUB_CLIENT_ID,
    github_client_secret: process.env.GITHUB_CLIENT_SECRET,
    github_callback_url: process.env.GITHUB_CALLBACK_URL,

    port: process.env.PORT,
    mongodb_dev: process.env.MONGODB_URL_DEV,
    mongodb_prod: process.env.MONGODB_URL_PROD,
    node_env: process.env.NODE_ENV,
    secret: process.env.SECRET,
    mail_secret: process.env.MAIL_SECRET
};