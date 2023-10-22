const Data = require('../models/Data');
const Folder = require('../models/Folder');
const sendData = async (req, res) => {
    const { title,latitude,longitude,user,folder } = req.body;

    const file = req.file;

    try {

        let newData;

        if(file){
            newData = new Data({
                user : user,  
                folder:folder,
                title: title,
                image: {
                  data: file.buffer, 
                  contentType: file.mimetype, 
                },
                latitude:latitude,
                longitude:longitude
              });
        }
        else{
            newData = new Data({
                user : user,  
                folder:folder,
                title: title,
                latitude:latitude,
                longitude:longitude
              });
        }

      const saveData = await newData.save();
      if (folder) {
        await Folder.findByIdAndUpdate(
          folder,
          { $addToSet: { data: saveData._id } }, 
          { new: true, upsert: true }
        );
      }
      res.status(200).json(saveData);
    } catch (err) {
      console.log('Error:', err);
      res.status(500).json(err);
    }
  }

module.exports = {sendData};