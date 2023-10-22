const Folder = require("../models/Folder");

const createFolder = async(req,res) =>{


    const {user,folderName} = req.body;

    try{

        const folder = new Folder({
            user:user,
            folderName:folderName
        });

        const saveFolder = await folder.save();
        res.status(200).json(saveFolder);
    }
    catch(error){
        res.status(500).json(`Error : ${error}`);
        console.log(`Error : ${error}`);
    }
}

module.exports = {createFolder};