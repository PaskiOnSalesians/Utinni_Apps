import {Schema, model} from 'mongoose'

const schoolSchema = new Schema({
    name: String,
    country: String,
    house:[{
        id: Schema.Types.ObjectId,
        name: String
    }]
},{
    timestamps: true,
    versionKey: false
})

export default model('School', schoolSchema);