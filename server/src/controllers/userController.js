const User = require("../models/userModel");

const register = async(req, res) => {
    if (!req.body.username && !req.body.email && !req.body.password) {
        res.status(400).send({ message: "Content can not be empty !"});
    }

    const newUser = new User({
        username: req.body.username,
        email: req.body.email,
        password: req.body.password
    })
    await newUser.save().then(data => {
        res.status(201).json(data);
    }).catch(error => {
        res.status(400).json({ message : error.message});
    });
};

const getUsers = async(req, res) => {
    try {
        const user = await User.find();
        res.status(200).json(user);
    } catch(error) {
        res.status(404).json({message: error.message});
    }
};

const login = async (req,res) => {
    try {
        const username = req.body.username;
        const user = await User.findOne({username: username});
        res.status(200).json(user);
    } catch(error) {
        res.status(404).json({ message: error});
    }
};

const updateUser = async(req, res) => {
    if (!req.body) {
        res.status(400).send({message: "Data to update can not be empty!"});
    }

    const id = req.params.id;

    await User.findByIdAndUpdate(id, req.body, { useFindAndModify: false }).then(data => {
        if (!data) {
            res.status(404).send({message: `User not found.`});
        } else {
            res.send({ message: "User updated successfully." })
        }
    }).catch(error => {
        res.status(500).send({message: error.message});
    });
};

const deleteUser = async(req, res) => {
    await User.findByIdAndRemove(req.params.id).then(data => {
        if (!data) {
          res.status(404).send({message: `User not found.`});
        } else {
          res.send({message: "User deleted successfully!"});
        }
    }).catch(error => {
        res.status(500).send({message: error.message});
    });
};

module.exports = { register, login, getUsers, updateUser, deleteUser };