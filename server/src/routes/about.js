const ip = require('ip');

module.exports = function getAbout(req, res) {
    let time = (new Date).getTime()

    res.json({

        "client": {
            "host": ip.address()
        },

        "server": {
            "current_time": time,
            "services": [
                {
                    "name": "gmail",
                    "reactions": [
                        {
                            "name": "top_headlines_mail",
                            "description": "Reveive an email with top headlines informations about a word"
                        } , {
                            "name": "weather_mail",
                            "description": "You receive weather infos by mail at 9AM"
                        }, {
                            "name": "top_news_mail",
                            "description": "Receive an email with top news everyday morning"
                        }, {
                            "name": "top_movies_mail",
                            "description": "Receive top movies informations every saturday"
                        }, {
                            "name": "latest_movie_mail",
                            "description": "Receive latest movie informations every morning"
                        }, {
                            "name": "quotes_mail",
                            "description": "Receive 5 quotes everyday  at 9am"
                        }, {
                            "name": "image_mail",
                            "description": "Receive image every morning at 9am"
                        }
                    ]
                }, {
                    "name": "github",
                    "actions": [
                        {
                            "name": "user_info",
                            "description": "Informations about the profile of the user"
                        }, {
                            "name": "repos_issues",
                            "description": "Get all issues for a specified repo"
                        }, {
                            "name": "repos_commits",
                            "description": "Get all commits for a specified repo"
                        }, {
                            "name": "repos_list",
                            "description": "Get all repo for a specified user"
                        }
                    ]
                }, {
                    "name": "youtube",
                    "actions": [
                        {
                            "name": "channel_infos",
                            "description": "Get informations about a channel researched by a word"
                        }, {
                            "name": "video_infos",
                            "description": "Get informations about a video researched by a word"
                        }, {
                            "name": "channel_last_video",
                            "description": "Get latest video of a channel"
                        }
                    ],
                    "reactions": [
                        {
                            "name": "post_comment",
                            "description": "Comment under a specified video"
                        }, {
                            "name": "like_video",
                            "description": "Like the first video researched by a word"
                        }, {
                            "name": "dislike_video",
                            "description": "Dislike the first video researched by a word"
                        }
                    ]
                }, {
                    "name": "weather",
                    "actions": {
                        "name": "get_weather",
                        "description": "Get weather infos of a specified city"
                    }
                },  {
                    "name": "lorem_picsum_image",
                    "actions": {
                        "name ": "random_image",
                        "description": "Get a random image with height and width"
                    },
                }, {
                    "name": "news",
                    "actions": [
                        {
                            "name": "top_news",
                            "description": "See the most recent top headlines"
                        }, {
                            "name": "top_headlines",
                            "description": "Get news with a specified word"
                        }
                    ]
                }, {
                    "name": "movies",
                    "actions": [
                        {
                            "name": "latest_movie",
                            "description": "Get latest movie informations"
                        }, {
                            "name": "top_movies",
                            "description": "Get top movies of the moment"
                        }, {
                            "name": "movie_details",
                            "description": "Get movie details"
                        }
                    ]
                }, {
                    "name": "quotes",
                    "actions": {
                        "name": "get_quote",
                        "description": "Get 5 programming quotes"
                    }
                }, {
                    "name": "timer",
                    "reactions": [
                        {
                            "name": "specific_hour",
                            "description": "Triggers something at specific time"
                        }, {
                            "name": "specific_day",
                            "description": "Triggers something a specific day"
                        }
                    ]
                }
            ]
        }
    })
};