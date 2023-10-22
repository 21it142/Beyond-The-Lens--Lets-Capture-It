const router = require('express').Router();

const {signUp} = require('../controller/signUp');
const {signIn} = require('../controller/signIn');
const {forgotPassword} = require('../controller/forgotPassword');
// const {logout} = require('../controller/logout');

router.post('/signup',signUp);

router.post('/signin',signIn);

router.put('/forgotpassword',forgotPassword);

// router.post('/logout',logout);

module.exports = router;