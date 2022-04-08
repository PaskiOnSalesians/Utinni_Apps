import {Schema, model} from 'mongoose'

const characterSchema = new Schema({
    firstname: String,
    lastname: String,
    gender: String,
    school_id: Schema.Types.ObjectId,
    wand_id: Schema.Types.ObjectId,
    spells_id:[{
        type: Schema.Types.ObjectId
    }]
},{
    timestamps: true,
    versionKey: false
})

export default model('Character', characterSchema);