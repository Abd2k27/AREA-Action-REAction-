# Youtube API

With the YouTube Data API, you can add a variety of YouTube features to your application. Use the API to upload videos, manage playlists and subscriptions, update channel settings, and more.

## Before Starting

- You need a Google Account to access the Google API Console, request an API key, and register your application.

- Create a project in the Google Developers Console and obtain authorization credentials so your application can submit API requests.

- After creating your project, make sure the YouTube Data API is one of the services that your application is registered to use:
    * Go to the API Console and select the project that you just registered.
    * Visit the Enabled APIs page. In the list of APIs, make sure the status is ON for the YouTube Data API v3.

## Endpoints

API endpoints and what they require and do.

- `http://area-backend-api.herokuapp.com/services/youtube/video_infos`
- `http://area-backend-api.herokuapp.com/services/youtube/channel_infos`
- `http://area-backend-api.herokuapp.com/services/youtube/last_video`
- `http://area-backend-api.herokuapp.com/services/youtube/like_video`
- `http://area-backend-api.herokuapp.com/services/youtube/dislike_video`
- `http://area-backend-api.herokuapp.com/services/youtube/comment_video`