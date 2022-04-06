const axios = require("axios");

const getRandomImage = async(req, res) => {

  axios.get(`https://picsum.photos/${req.body.width}/${req.body.height}`)
    .then((data) => res.json(data.config.url))
    .catch((error) => console.log(error))
};

module.exports = { getRandomImage };