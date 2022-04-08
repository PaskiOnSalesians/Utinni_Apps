import {Schema, model} from 'mongoose'

const wandSchema = new Schema({
    user_id:[{
         type: Schema.Types.ObjectId,
    }],
    core: String,
    wand: String,
    length: Number
},{
    timestamps: true,
    versionKey: false
})

export default model('Wand', wandSchema);