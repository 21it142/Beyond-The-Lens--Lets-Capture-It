const router = require('express').Router();


const {createFolder} = require('../controller/createFolder');
const {getFolder} = require('../controller/getFolder');
const {deleteFolder} = require('../controller/deleteFolder');

router.get('/folder',getFolder);

router.post('/folder',createFolder);

router.delete('/del-folder',deleteFolder);

module.exports = router;