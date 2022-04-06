const nodemailer = require('nodemailer');
const dotenv = require("dotenv").config()
const envs = require("./config");

module.exports = transporter = nodemailer.createTransport({
  service: 'gmail',
  auth: {
    user: "hamidtessilimi@gmail.com",
    pass: envs.mail_secret,
  },
});