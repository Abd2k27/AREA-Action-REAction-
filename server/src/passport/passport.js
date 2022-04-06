const passport = require("passport");
const LocalStrategy = require("passport-local").Strategy;
const GoogleStrategy = require("passport-google-oauth20").Strategy;
const GithubStrategy = require("passport-github-oauth20").Strategy;

const User = require("../models/userModel");
const envs = require("../config/config");

passport.serializeUser(User.serializeUser());
passport.deserializeUser(User.deserializeUser());

passport.use(new LocalStrategy(User.authenticate()));

passport.use(new GoogleStrategy({
    clientID: envs.google_client_id,
    clientSecret: envs.google_client_secret,
    callbackURL: envs.google_callback_url
  }, async (accessToken, refreshToken, profile, done) => {
    try {
      const user = await User.findOne({ where: { email: profile.emails[0].value }})
      if (user != null) {
        user.services_data.push({name: profile.provider, id: profile.id, accessToken: accessToken });
        await User.findByIdAndUpdate(user._id, user);
        return done(null, user);
      } else {
        let newUser = new User({
          username: profile.name.givenName,
          email: profile.emails[0].value,
          email_is_verified: profile.emails[0].verified,
          services_data: {
            name: profile.provider,
            id: profile.id,
            accessToken: accessToken,
            data: {}
          }
        });
        newUser.save(function(error, savedUser) {
          if (error)
            console.log(error);
          return done(error, savedUser);
        });
      }
    } catch (error) {
      done(error);
    }
}));

passport.use(new GithubStrategy({
    clientID: envs.github_client_id,
    clientSecret: envs.github_client_secret,
    callbackURL: envs.github_callback_url
  }, async (accessToken, refreshToken, profile, done) => {
    try {
      const user = await User.findOne({ where: { email: profile.emails[0].value }});
      user.services_data.push({name: profile.provider, id: profile.id, accessToken: accessToken, data: {username: profile.username}});
      await User.findByIdAndUpdate(user._id, user);
      return done(null, user);
    } catch (error) {
      done(error);
    }
  })
);

module.exports = passport;