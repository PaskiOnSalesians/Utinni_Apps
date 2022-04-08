import {Schema, model} from 'mongoose'

const activitySchema = new Schema({
    name: String,
    scores: [{
        user:{
            user_id: Schema.Types.ObjectId,
            score: Number
        },
    }],

},{
    timestamps: true,
    versionKey: false
})

export default model('Activity', activitySchema);