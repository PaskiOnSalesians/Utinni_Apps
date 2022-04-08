import {Router} from 'express'
const router = Router()

import * as wandCtrl from '../controllers/wands.controller'
import {authJwt} from '../middlewares'

router.get('/', wandCtrl.getWands) // Obtener varitas

router.get('/:wandId', wandCtrl.getWandById) // Obtener varita por id

router.post('/', [authJwt.verifyToken, authJwt.isModerator], wandCtrl.createWand) // Crear varita

router.put('/:wandId', [authJwt.verifyToken, authJwt.isModerator], wandCtrl.updateWandById) // Actualizar varita por id

router.delete('/:wandId', [authJwt.verifyToken, authJwt.isAdmin], wandCtrl.deleteWandById) // Borrar varita por id

export default router;