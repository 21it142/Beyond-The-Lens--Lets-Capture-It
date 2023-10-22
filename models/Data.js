const mongoose = require('mongoose');

const Data = new mongoose.Schema({

    user: {
        type: mongoose.Schema.Types.ObjectId,
        ref: "User",
        required: true
    },
    folder: {
        type: mongoose.Schema.Types.ObjectId,
        ref: "Folder",
        required: true
    },
    title: {
        type: String,
        required: true
    },
    image: {
        data: Buffer,
        contentType: String,
        // required: true,
    },
    longitude: {
        type: String,
        // required:true
    },
    latitude: {
        type: String,
        // required:true
    }

},
    { timestamps: true }
)

module.exports = mongoose.model("Data", Data);