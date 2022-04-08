import Character from '../models/Character'

export const createCharacter = async (req, res) =>{

    const{firstname, lastname, gender, school_id, wand_id, spells_id} = req.body
    try {
        const newCharacter = new Character({firstname, lastname, gender, school_id, wand_id, spells_id})

        const characterSaved = await newCharacter.save()

        res.status(201).json(characterSaved)
    } catch (error) {
        console.log(error)
    }
}

export const getCharacters = async (req, res) =>{
    const characters = await Character.find()

    res.json(characters)
}

export const getCharacterById = async (req, res) =>{
    const character = await Character.findById(req.params.characterId);

    res.status(200).json(character)
}

export const updateCharacterById = async (req, res) =>{
    const updatedCharacter = await Character.findByIdAndUpdate(req.params.characterId, req.body, {
        new: true
    })

    res.status(200).json(updatedCharacter)
}

export const deleteCharacterById = async (req, res) =>{

    const {characterId} = req.params;
    await Character.findByIdAndDelete(characterId)

    res.status(204).json()
}