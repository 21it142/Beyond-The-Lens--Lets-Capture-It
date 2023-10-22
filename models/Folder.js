const mongoose = require("mongoose");

const Folder = new mongoose.Schema({

    user:{
        type:mongoose.Schema.Types.ObjectId,
        ref:'User',
        required:true
    },
    folderName:{
        type:String,
        required:true
    },
    data:{
        type:[mongoose.Schema.Types.ObjectId],
        ref:"Data",
        required:false
    }
},
{timestamps:true}
)
module.exports = mongoose.model("Folder",Folder);