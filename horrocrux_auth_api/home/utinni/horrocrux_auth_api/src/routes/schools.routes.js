import {Router} from 'express'
const router = Router()

import * as schoolCtrl from '../controllers/schools.controller'
import {authJwt} from '../middlewares'

router.get('/', schoolCtrl.getSchools) // Obtener escuelas

router.get('/:schoolId', schoolCtrl.getSchoolById) // Obtener escuela por id

router.post('/', [authJwt.verifyToken, authJwt.isModerator], schoolCtrl.createSchool) // Crear escuela

router.put('/:schoolId', [authJwt.verifyToken, authJwt.isModerator], schoolCtrl.updateSchoolById) // Actualizar escuela por id

router.delete('/:schoolId', [authJwt.verifyToken, authJwt.isAdmin], schoolCtrl.deleteSchoolById) // Borrar escuela por id

export default router;