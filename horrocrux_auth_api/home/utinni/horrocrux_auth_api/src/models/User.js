import {Schema, model} from 'mongoose'
import bcrypt from 'bcryptjs'

const userSchema = new Schema({
    username:{
        type: String,
        unique: true
    },
    email:{
        type: String,
        unique: true
    },
    password: {
        type: String,
        required: true
    },
    gender:{
        type: String,
    },
    firstname:{
        type: String,
    },
    lastname:{
        type: String,
    },
    school_id:{
        type: Schema.Types.ObjectId,
    },
    wand_id:{
        type: Schema.Types.ObjectId,
    },
    galleons:{
        type: Number,
    },
    friends_id:[{
        type: Schema.Types.ObjectId,
    }],
    spells_id:[{
        type: Schema.Types.ObjectId,
    }],
    roles: [{
        type: Schema.Types.ObjectId,
        ref: "Role"
    }]
}, {
    timestamps: true,
    versionKey: false
});

userSchema.statics.encryptPassword = async (password) => {
    const salt = await bcrypt.genSalt(10)
    return await bcrypt.hash(password, salt)
}

userSchema.statics.comparePassword = async (password, receivedPassword) => {
    return await bcrypt.compare(password, receivedPassword)
}


export default model('User', userSchema);