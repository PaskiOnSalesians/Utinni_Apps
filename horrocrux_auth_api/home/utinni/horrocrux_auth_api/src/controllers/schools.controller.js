import School from '../models/School'

export const createSchool = async (req, res) =>{

    const{name, country, house} = req.body
    try {
        const newSchool = new School({name, country, house})

        const schoolSaved = await newSchool.save()

        res.status(201).json(schoolSaved)
    } catch (error) {
        console.log(error)
    }
}

export const getSchools = async (req, res) =>{
    const schools = await School.find()

    res.json(schools)
}

export const getSchoolById = async (req, res) =>{
    const school = await School.findById(req.params.schoolId);

    res.status(200).json(school)
}

export const updateSchoolById = async (req, res) =>{
    const updatedSchool = await School.findByIdAndUpdate(req.params.schoolId, req.body, {
        new: true
    })

    res.status(200).json(updatedSchool)
}

export const deleteSchoolById = async (req, res) =>{

    const {schoolId} = req.params;
    await School.findByIdAndDelete(schoolId)

    res.status(204).json()
}