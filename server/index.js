const express = require("express");
const mongoose = require("mongoose");
const MongoStore = require("connect-mongo");
const session = require("express-session");
const bodyParser = require("body-parser");
const cors = require("cors");

const passport = require("./src/passport/passport");
const envs = require("./src/config/config");
const router = require("./src/routes/index");

const app = express();

const port = envs.port || 8080;

mongoose.Promise = global.Promise;

mongoose.connect(envs.mongodb_prod, {useNewUrlParser: true})
  .then(() => console.log("Successfully connected to the database"))
  .catch((err) => {
    console.log("Could not connect to the database. Error: ", err);
    process.exit();
  });

app.use(bodyParser.json());

app.use(bodyParser.urlencoded({ extended: true }));

app.use(cors());

app.use(session({
    secret: envs.secret,
    resave: false,
    saveUninitialized: true,
    store: MongoStore.create({ mongoUrl: envs.mongodb_prod  })
}))

app.use(passport.initialize());
app.use(passport.session());

app.use('/', router);

app.listen(port, () => {
    console.log("Server running on port: ", port);
})