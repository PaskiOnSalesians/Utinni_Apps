import {Schema, model} from 'mongoose'

const spellSchema = new Schema({
    name: String,
    description: String
},{
    timestamps: true,
    versionKey: false
})

export default model('Spell', spellSchema);