import app from './app'
import './database'

import fs from 'fs'
import https from 'https'
const port = 3000;

const options = {
    key: fs.readFileSync(__dirname + '/ssl/key.pem'),
    cert: fs.readFileSync(__dirname + '/ssl/cert.pem')
};

app.listen(port);
//https.createServer(options, app).listen(port);

console.log('Server listen on port', port)