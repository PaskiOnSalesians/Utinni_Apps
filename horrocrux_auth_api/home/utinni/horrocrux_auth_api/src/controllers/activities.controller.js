import Activity from '../models/Activity'

export const createActivity = async (req, res) =>{

    const{name, scores} = req.body
    try {
        const newActivity = new Activity({name, scores})

        const activitySaved = await newActivity.save()

        res.status(201).json(activitySaved)
    } catch (error) {
        console.log(error)
    }
}

export const getActivities = async (req, res) =>{
    const activities = await Activity.find()

    res.json(activities)
}

export const getActivityById = async (req, res) =>{
    const activity = await Activity.findById(req.params.activityId);

    res.status(200).json(activity)
}

export const updateActivityById = async (req, res) =>{
    const updatedActivity = await Activity.findByIdAndUpdate(req.params.activityId, req.body, {
        new: true
    })

    res.status(200).json(updatedActivity)
}

export const deleteActivityById = async (req, res) =>{

    const {activityId} = req.params;
    await Activity.findByIdAndDelete(activityId)

    res.status(204).json()
}