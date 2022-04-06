const mongoose = require("mongoose");

const ActionSchema = new mongoose.Schema({
    service: { type: String, required: true },
    name: { type: String, required: true },
    data: { type: Object, required: true }
});

const ReactionSchema = new mongoose.Schema({
    service: { type: String, required: true },
    name: { type: String, required: true },
    data: { type: Object, required: true }
});

const AreaSchema = new mongoose.Schema({
    user_id: { type: String, required: true },
    action: { type: ActionSchema, required: true },
    reaction: { type: ReactionSchema }
});

module.exports = areaModel = mongoose.model('Area', AreaSchema);