import {Router} from 'express'
const router = Router()

import * as usersCtrl from "../controllers/user.controller";
import { authJwt, verifySignup } from "../middlewares";

router.get('/', [authJwt.verifyToken, authJwt.isAdmin], usersCtrl.getUsers) // Obtener usuarios

router.get('/:userId', [authJwt.verifyToken], usersCtrl.getUserById) // Obtener usuario por id

router.post("/", [authJwt.verifyToken, authJwt.isAdmin, verifySignup.checkDuplicateUsernameOrEmail], usersCtrl.createUser); // Crear usuario

router.put('/:userId', [authJwt.verifyToken], usersCtrl.updateUserById) // Actualizar usuario por id

router.delete('/:userId', [authJwt.verifyToken, authJwt.isAdmin], usersCtrl.deleteUserById) // Borrar usuario por id

export default router;