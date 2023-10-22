const Data = require('../models/Data');

const deleteData = async (req, res) => {
    const {id} = req.body;
    try {
        const data = await Data.findByIdAndDelete(id);

        if (!data) {
            return res.status(404).json("No Such Data Found.");
        }

        res.status(200).json(`Deleted Successfully: ${data}`);
    } catch (error) {
        res.status(500).json(`Error: ${error}`);
        console.error(`Error: ${error}`);
    }
}

module.exports = { deleteData };
