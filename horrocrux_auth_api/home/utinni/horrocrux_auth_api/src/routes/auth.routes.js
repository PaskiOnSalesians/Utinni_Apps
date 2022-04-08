import {Router} from 'express'
const router = Router()

import * as authCtrl from '../controllers/auth.controller'

router.post('/signup', authCtrl.signup) // Registrarse
router.post('/signin', authCtrl.signin) // Acceder / Login

export default router;