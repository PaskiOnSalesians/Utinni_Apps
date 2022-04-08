import User from '../models/User'
import Role from '../models/Role';

import jwt from 'jsonwebtoken'
import config from '../config'

export const signup = async (req, res) => {
    try{
        const{username, email, password, firstname, lastname, gender, school_id, wand_id, galleons, roles} = req.body;

        const newUser = new User({
            username,
            email,
            password: await User.encryptPassword(password),
            firstname,
            lastname,
            gender,
            school_id,
            wand_id,
            galleons
        })

        if(req.body.roles){
            const foundRoles = await Role.find({name: {$in: roles}})
            newUser.roles = foundRoles.map((role) => role._id)
        } else{
            const role = await Role.findOne({ name: "user" })
            newUser.roles = [role._id];
        }

        const savedUser = await newUser.save();

        const token = jwt.sign({id: savedUser._id}, config.SECRET, {
            expiresIn: 86400 // 24 horas
        })

        return res.status(200).json({token, success: true, id: savedUser._id});
    }catch(error){
        console.log(error)
        return res.status(500).json({error, message: "User already registered"});
    }
    
}

export const signin = async (req, res) => {
    try {
        const userFound = await User.findOne({ username: req.body.username }).populate("roles");

        if (!userFound) return res.status(400).json({ message: "User Not Found" });

        const matchPassword = await User.comparePassword(req.body.password, userFound.password);

        if (!matchPassword) return res.status(401).json({token: null, message: "Invalid Password"});

        const token = jwt.sign({ id: userFound._id }, config.SECRET, {
            expiresIn: 86400, // 24 horas
        });
    
        res.json({token, success: true, id: userFound._id});
      } catch (error) {
        console.log({error, message: "There was an error with your login"});
      }   
}

