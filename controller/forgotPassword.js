const User = require('../models/User')
const forgotPassword = async (req, res) => {
    try {
      const { email, password } = req.body;
      const user = await User.findOne({ email });
      if (!user) {  
        return res.status(400).json({ error: 'User not found' });
      }
      const updatedUser = await User.findByIdAndUpdate(user._id, { password: password }, { new: true });
      res.status(200).json(updatedUser);
    } catch (err) {
      res.status(500).json(err);
    }
  }

module.exports = {forgotPassword};