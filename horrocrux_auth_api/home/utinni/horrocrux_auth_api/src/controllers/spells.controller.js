import Spell from '../models/Spell'

export const createSpell = async (req, res) =>{

    const{name, description} = req.body
    try {
        const newSpell = new Spell({name, description})

        const spellSaved = await newSpell.save()

        res.status(201).json(spellSaved);
    } catch (error) {
        console.log(error);
    }

    
}

export const getSpells = async (req, res) =>{
    const spells = await Spell.find()

    res.json(spells)
}

export const getSpellById = async (req, res) =>{
    const spell = await Spell.findById(req.params.spellId);
    res.status(200).json(spell)
}

export const updateSpellById = async (req, res) =>{
    const updatedSpell = await Spell.findByIdAndUpdate(req.params.spellId, req.body, {
        new: true
    })

    res.status(200).json(updatedSpell)
}

export const deleteSpellById = async (req, res) =>{

    const {spellId} = req.params;
    await Spell.findByIdAndDelete(spellId)

    res.status(204).json()
}