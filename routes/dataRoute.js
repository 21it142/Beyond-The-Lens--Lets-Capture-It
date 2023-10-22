const router = require('express').Router();
const multer = require('multer');

const storage = multer.memoryStorage(); 
const upload = multer({ storage: storage });

const {sendData} = require('../controller/sendData');
const {getData} = require('../controller/getData');
const {deleteData} = require('../controller/deleteData');

router.get('/data',getData);

router.post('/data', upload.single('image'),sendData);

router.delete('/del-data',deleteData);

module.exports = router;