const mongoose = require("mongoose");
const passportLocalMongoose = require('passport-local-mongoose');
const findOrCreate = require('mongoose-findorcreate')

const ServiceProviderSchema = new mongoose.Schema({
    name: { type: String, default: "" },
    id: { type: String, default: "" },
    access_token: { type: String, default: "" },
    refresh_token: { type: String, default: "" },
    data: { type: Object, default: {} }
});

const UserSchema = new mongoose.Schema({
    username: { type: String },
    email: { type: String, unique: true },
    email_is_verified: { type: Boolean, default: false },
    password: { type: String },
    services_data: [{ type: Map, of: ServiceProviderSchema, default: [] }],
    date: { type: Date, default: Date.now }
});

UserSchema.plugin(passportLocalMongoose);
UserSchema.plugin(findOrCreate);

module.exports = User = mongoose.model("User", UserSchema);