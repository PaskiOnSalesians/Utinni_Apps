import mongoose from 'mongoose'

mongoose.connect("mongodb://51.83.97.10:8454/horrocrux", {
    useNewUrlParser: true,
    useUnifiedTopology: true,
})
    .then(db => console.log('StarGate opened'))
    .catch(error => console.log(error))