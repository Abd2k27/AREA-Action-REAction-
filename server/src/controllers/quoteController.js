const axios = require("axios");

const getQuote = async(req, res) => {

  axios.get(`http://programming-quotes-api.herokuapp.com/Quotes?count=5`)
    .then((data) => res.json(data.data))
    .catch((error) => console.log(error))
};

module.exports = { getQuote };