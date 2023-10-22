const Data = require('../models/Data')

const getData = async (req, res) => {
  const {user} = req.body;
    try {
      const data = await Data.find({user:user});
      res.status(200).json(data);
    } catch (err) {
      console.log('Error:', err);
      res.status(500).json(err);
    }
  }

module.exports = {getData};