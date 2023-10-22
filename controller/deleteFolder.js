const Folder = require("../models/Folder");

const deleteFolder = async(req,res) =>{

    const {id} = req.body;

    try {
        const folder = await Folder.findByIdAndDelete(id);

        if (!folder) {
            return res.status(404).json("No Such Data Found.");
        }

        res.status(200).json(`Deleted Successfully: ${folder}`);
    } catch (error) {
        res.status(500).json(`Error: ${error}`);
        console.error(`Error: ${error}`);
    }
}

module.exports = {deleteFolder};