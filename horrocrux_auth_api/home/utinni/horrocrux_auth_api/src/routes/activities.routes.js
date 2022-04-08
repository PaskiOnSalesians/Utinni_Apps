import {Router} from 'express'
const router = Router()

import * as activityCtrl from '../controllers/activities.controller'
import {authJwt} from '../middlewares'

router.get('/', activityCtrl.getActivities) // Obtener actividades

router.get('/:activityId', activityCtrl.getActivityById) // Obtener actividad por id

router.post('/', [authJwt.verifyToken, authJwt.isModerator], activityCtrl.createActivity) // Crear actividad

router.put('/:activityId', [authJwt.verifyToken, authJwt.isModerator], activityCtrl.updateActivityById) // Actualizar actividad por id

router.delete('/:activityId', [authJwt.verifyToken, authJwt.isAdmin], activityCtrl.deleteActivityById) // Borrar actividad por id

export default router;