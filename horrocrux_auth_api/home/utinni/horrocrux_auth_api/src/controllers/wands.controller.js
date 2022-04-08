import Wand from '../models/Wand'

export const createWand = async (req, res) =>{

    const{name, scores} = req.body
    try {
        const newWand = new Wand({name, scores})

        const wandSaved = await newWand.save()

        res.status(201).json(wandSaved)
    } catch (error) {
        console.log(error)
    }
}

export const getWands = async (req, res) =>{
    const wands = await Wand.find()

    res.json(wands)
}

export const getWandById = async (req, res) =>{
    const wand = await Wand.findById(req.params.wandId);

    res.status(200).json(wand)
}

export const updateWandById = async (req, res) =>{
    const updatedWand = await Wand.findByIdAndUpdate(req.params.wandId, req.body, {
        new: true
    })

    res.status(200).json(updatedWand)
}

export const deleteWandById = async (req, res) =>{

    const {wandId} = req.params;
    await Wand.findByIdAndDelete(wandId)

    res.status(204).json()
}