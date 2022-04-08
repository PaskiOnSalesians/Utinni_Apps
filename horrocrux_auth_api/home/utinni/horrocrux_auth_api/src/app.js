import express from 'express'
import morgan from 'morgan'
import pkg from '../package.json'

import {createRoles} from './libs/initialSetup'

import charactersRoutes from './routes/characters.routes'
import wandsRoutes from './routes/wands.routes'
import schoolsRoutes from './routes/schools.routes'
import spellsRoutes from './routes/spells.routes'
import activitiesRoutes from './routes/activities.routes'
import usersRoutes from './routes/user.routes'
import authRoutes from './routes/auth.routes'

const app = express()
createRoles();

app.set('pkg', pkg)

app.use(morgan('dev'));
app.use(express.json());

app.get('/', (req, res) =>{
    res.json({
        name: app.get('pkg').name,
        author: app.get('pkg').author,
        description: app.get('pkg').description,
        version: app.get('pkg').version
    })
})

app.use('/api/wands', wandsRoutes)
app.use('/api/schools', schoolsRoutes)
app.use('/api/characters', charactersRoutes)
app.use('/api/users', usersRoutes)
app.use('/api/spells', spellsRoutes)
app.use('/api/activities', activitiesRoutes)
app.use('/api/auth', authRoutes)

export default app;