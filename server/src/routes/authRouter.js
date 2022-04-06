const express = require("express");
const passport = require("../passport/passport");
const authRouter = express.Router();

const userController = require("../controllers/userController")

authRouter.post("/register", userController.register);
authRouter.post("/login", userController.login);
authRouter.get("/users", userController.getUsers);
authRouter.put("/users/:id", userController.updateUser);
authRouter.delete("/users/:id", userController.deleteUser);

authRouter.get("/google", passport.authenticate('google', { scope: ['email', 'profile', 'https://www.googleapis.com/auth/youtubepartner', 'https://www.googleapis.com/auth/youtube', 'https://www.googleapis.com/auth/youtube.force-ssl'] }));
authRouter.get("/google/callback", passport.authenticate('google', { failureRedirect: '/auth/login' , session: false}), (req, res) => res.redirect('/'));

authRouter.get("/github", passport.authenticate("github", { scope: ["user"] }));
authRouter.get("/github/callback", passport.authenticate("github", { failureRedirect: "/auth/login" }), (req, res) => res.redirect("/"));

authRouter.get("/logout"), (req, res) => {
  req.logout();
  res.redirect("/auth/login")
};

module.exports = authRouter;