import {Router} from 'express'
const router = Router()

import * as spellsCtrl from '../controllers/spells.controller'
import {authJwt} from '../middlewares'

router.get('/', spellsCtrl.getSpells) // Obtener hechizos

router.get('/:spellId', spellsCtrl.getSpellById) // Obtener hechizo por id

router.post('/', [authJwt.verifyToken, authJwt.isModerator], spellsCtrl.createSpell) // Crear hechizo

router.put('/:spellId', [authJwt.verifyToken, authJwt.isModerator], spellsCtrl.updateSpellById) // Actualizar hechizo por id

router.delete('/:spellId', [authJwt.verifyToken, authJwt.isAdmin], spellsCtrl.deleteSpellById) // Borrar hechizo por id

export default router;