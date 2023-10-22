const Folder = require("../models/Folder");

const getFolder = async(req,res) =>{

    const {user} = req.body;

    try{

        const folder = await Folder.find({user:user});
        res.status(200).json(folder);
    }
    catch(error){
        res.status(500).json(`Error : ${error}`);
        console.log(`Error : ${error}`);
    }
}

module.exports = {getFolder};