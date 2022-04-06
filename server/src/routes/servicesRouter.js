const express = require("express");
const servicesRouter = express.Router();
const User = require("../models/userModel");

const githubController = require("../controllers/githubController");
const moviesController = require("../controllers/moviesController");
const weatherController = require("../controllers/weatherController");
const youtubeController = require("../controllers/youtubeController");
const newsController = require("../controllers/newsController");
const imageController = require("../controllers/imageController");
const mailController = require("../controllers/mailController");
const quoteController = require("../controllers/quoteController");

servicesRouter.get("/", async (req,res) => {
  try {
    const username = req.body.username;
    const user = await User.findOne({username: username});
    res.status(200).json(user.services_data);
  } catch(error) {
    res.status(404).json({ message: error });
  };
});

servicesRouter.post("/mail/weather", mailController.weather_mail);
servicesRouter.post("/mail/latest_movies", mailController.latest_movies_mail);
servicesRouter.post("/mail/top_movies", mailController.top_movies_mail);
servicesRouter.post("/mail/top_headlines", mailController.top_headlines_mail);
servicesRouter.post("/mail/top_news", mailController.top_news_mail);
servicesRouter.post("/mail/quotes", mailController.get_quotes_mail);
servicesRouter.post("/mail/image", mailController.image_mail);

servicesRouter.post("/github/infos", githubController.getGithubInfos);
servicesRouter.post("/github/repos", githubController.getGithubRepos);
servicesRouter.post("/github/issues", githubController.getReposIssues);
servicesRouter.post("/github/commits", githubController.getReposCommits);
//servicesRouter.post("/github/post_issue", githubController.postNewIssue);

servicesRouter.get("/movies/top", moviesController.getTopMovies);
servicesRouter.get("/movies/latest", moviesController.getLatestMovies);
servicesRouter.post("/movies/infos", moviesController.getMoviesDetails);

servicesRouter.post("/youtube/video_infos", youtubeController.getVideoInfos);
servicesRouter.post("/youtube/channel_infos", youtubeController.getChannelInfos);
servicesRouter.post("/youtube/like_video", youtubeController.likeYoutube);
servicesRouter.post("/youtube/dislike_video", youtubeController.dislikeYoutube);
servicesRouter.post("/youtube/last_video", youtubeController.lastVideo);
servicesRouter.post("/youtube/comment_video", youtubeController.commentYoutube);

servicesRouter.post("/news/by_word", newsController.getNewsByWord);
servicesRouter.get("/news/top_news", newsController.getTopNews);

servicesRouter.post("/weather", weatherController.getWeather);

servicesRouter.post("/image/random", imageController.getRandomImage);

servicesRouter.get("/quotes", quoteController.getQuote);

module.exports = servicesRouter;