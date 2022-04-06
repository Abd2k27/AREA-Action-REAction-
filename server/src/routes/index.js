const express = require("express");
const router = express.Router();

const getAbout = require("./about");
const authRouter = require("./authRouter");
const servicesRouter = require("./servicesRouter");

router.get("/", (req, res) => res.json({message: "Server is running successfully !"}));

router.get("/about.json", (req, res) => getAbout(req, res));

router.use('/auth', authRouter);

router.use("/services", servicesRouter);

module.exports = router;