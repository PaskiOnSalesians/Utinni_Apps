import User from "../models/User";
import Role from "../models/Role";

export const createUser = async (req, res) => {
  try {
    const { username, email, password, firstname, lastname, gender, school_id, wand_id, galleons, roles } = req.body;

    const rolesFound = await Role.find({ name: { $in: roles } });

    const user = new User({
      username,
      email,
      password,
      roles: rolesFound.map((role) => role._id),
      firstname,
      lastname,
      gender,
      school_id,
      wand_id,
      galleons
    });

    user.password = await User.encryptPassword(user.password);

    const savedUser = await user.save();

    return res.status(200).json({
      _id: savedUser._id,
      username: savedUser.username,
      email: savedUser.email,
      roles: savedUser.roles,
    });
  } catch (error) {
    console.error(error);
  }
}

export const getUsers = async (req, res) =>{
  const users = await User.find()

  res.json(users)
}

export const getUserById = async (req, res) =>{
  const user = await User.findById(req.params.userId);
  res.status(200).json(user)
}

export const updateUserById = async (req, res) =>{
  const updatedUser = await User.findByIdAndUpdate(req.params.userId, req.body, {
      new: true
  })

  res.status(200).json({success: true, updatedUser})
}

export const deleteUserById = async (req, res) =>{

  const {userId} = req.params;
  await User.findByIdAndDelete(userId)

  res.status(204).json()
}