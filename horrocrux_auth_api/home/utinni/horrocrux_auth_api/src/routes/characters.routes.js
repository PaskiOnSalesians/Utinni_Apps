import {Router} from 'express'
const router = Router()

import * as characterCtrl from '../controllers/characters.controller'
import {authJwt} from '../middlewares'

router.get('/', characterCtrl.getCharacters) // Obtener personajes

router.get('/:characterId', characterCtrl.getCharacterById) // Obtener personaje por id

router.post('/', [authJwt.verifyToken, authJwt.isModerator], characterCtrl.createCharacter) // Crear personaje

router.put('/:characterId', [authJwt.verifyToken, authJwt.isModerator], characterCtrl.updateCharacterById) // Actualizar personaje por id

router.delete('/:characterId', [authJwt.verifyToken, authJwt.isAdmin], characterCtrl.deleteCharacterById) // Borrar personaje por id

export default router;