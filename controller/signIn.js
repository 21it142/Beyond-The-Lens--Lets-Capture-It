const User = require("../models/User");
const signIn = async (req, res) => {
    try {
      const user = await User.findOne({ email: req.body.email });
  
      if(user){
        if(req.body.password !== user.password)
        return res.status(400).json({ error: 'Invalid password' });
    }
    console.log(user);
      res.status(200).json(user);
    } catch (err) {
      res.status(500).json(err);
    }
  }

module.exports = {signIn};