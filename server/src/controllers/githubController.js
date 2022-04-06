const axios = require("axios");
const { OAuthApp, createNodeMiddleware } = require("@octokit/oauth-app");
const envs = require("../config/config");

const User = require("../models/userModel");

const getGithubInfos = async(req, res) => {
  const api = {
    base: "https://api.github.com/"
  }
  const user = await User.findOne({username: req.body.username});
  var val = user.services_data.filter(student => student.get("name") == 'github');

  var config = {
      headers: {
          'Authorization': "Bearer " + val[0].get("accessToken"),
      }
  }

  axios.get(`${api.base}users/${val[0].get("data").username}`, {}, config)
    .then((data) => {
      res.json({
        "name": data.data.name,
        "url": data.data.url,
        "avatar_url": data.data.avatar_url,
        "location": data.data.location,
        "email": data.data.email,
        "bio": data.data.bio,
        "hireable": data.data.hireable,
        "twitter_username": data.data.twitter_username,
        "public_repos": data.data.public_repos,
        "followers": data.data.followers,
        "following": data.data.following,
        "total_private_repos": data.data.total_private_repos,
        "collaborators": data.data.collaborators
        })
      })
    .catch((error) => console.log(error))
};

function one_repo(all) {
  res = "";
  return ({
    "name": all.name,
    "description": all.description,
    "url": all.url,
    "clone_url": all.clone_url,
    "git_url": all.git_url,
    "bio": all.bio,
    "ssh_url": all.ssh_url,
    "forks_count": all.forks_count,
    "stargazers": all.stargazers,
    "watchers_count": all.watchers_count
    })
}

function concat_repo(all_repo) {
  var res = []
  for (var i = 0; i < all_repo.length ; i++)
    res.push(one_repo(all_repo[i]))
  return (res);
}

const getGithubRepos = async(req, res) => {
  const api = {
    base: "https://api.github.com/"
  }

  const user = await User.findOne({username: req.body.username});
  var val = user.services_data.filter(student => student.get("name") == 'github');

  var config = {
      headers: {
          'Authorization': "Bearer " + val[0].get("accessToken"),
      }
  }

  axios.get(`${api.base}users/${val[0].get("data").username}/repos`, {}, config)
  .then((data) => {
    res.json(concat_repo(data.data))
    })
    .catch((error) => console.log(error))
};

const getReposIssues = async(req, res) => {
  const api = {
    base: "https://api.github.com/"
  }

  const user = await User.findOne({username: req.body.username});
  var val = user.services_data.filter(student => student.get("name") == 'github');

  var config = {
      headers: {
          'Authorization': "Bearer " + val[0].get("accessToken"),
      }
  }

  axios.get(`${api.base}repos/${val[0].get("data").username}/${req.body.repo}/issues` , {}, config)
    .then((data) => res.json(data.data))
    .catch((error) => console.log(error))
};

const getReposCommits = async (req, res) => {
  const api = {
    base: "https://api.github.com/"
  }

  const user = await User.findOne({username: req.body.username});
  var val = user.services_data.filter(student => student.get("name") == 'github');

  var config = {
      headers: {
          'Authorization': "Bearer " + val[0].get("accessToken"),
      }
  }
  axios.get(`${api.base}repos/${val[0].get("data").username}/${req.body.repo}/commits` , {}, config)
    .then((data) => res.json(data.data))
    .catch((error) => console.log(error))
};

// const postNewIssue = async (req, res) => {

//   const user = await User.findOne({username: req.body.username});
//   var val = user.services_data.filter(student => student.get("name") == 'github');

//   var config = {
//       headers: {
//           "Accept": "application/vnd.github.v3+json",
//           'Authorization': "Bearer " + val[0].get("accessToken"),
//       }
//   }
//   //https://api.github.com/user/repos
//   // axios.post(`https://api.github.com/repos/${val[0].get("data").username}/${req.body.repo}/issues`, {
//     axios.post(`https://api.github.com/${val[0].get("data").username}/repos`, {
//       'name': req.body.title
//     }, config)
//     .then((data) => console.log(data))
//     .catch((error) => console.log(error));
// }

module.exports = { getGithubInfos, getGithubRepos, getReposCommits, getReposIssues };