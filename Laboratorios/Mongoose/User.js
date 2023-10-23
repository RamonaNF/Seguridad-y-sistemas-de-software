
const mongoose = require('mongoose')

const addressSchema = new mongoose.Schema({
    street: String,
    city: String
})

const userSchema = new mongoose.Schema({
    name: {
        type: String,
        required: true
    },
    age: {
        type: Number,
        min: 0,
        max: 118
    },

    email: {
        type: String,
        minLength: 10,
        //maxLength: 100
        lowercase: true
        //uppercase: true
    },
    address: addressSchema, // It'll have an id
    /*address: {
        street: String,
        city: String
    },*/

    bestFriend: {
        type: mongoose.SchemaTypes.ObjectId,
        ref: "User"
    },    
    hobbies: [String], // [] -> Array of anything

    oddLuckyNum: {
        type: Number,
        validate: { // Called when using create or save methods
            validator: v => v%2 === 1,
            message: props => `${props.value} is not an odd number! >:(`
        }
    },

    createdAt: {
        type: Date,
        immutable: true,
        default: () => Date.now()
    },
    updatedAt: {
        type: Date,
        default: () => Date.now()
    }
})



userSchema.methods.sayHi = function() {
    console.log(`Hey there! My name is ${this.name}`)
}

userSchema.statics.findByName = function(name) {
    return this.find({ name: new RegExp(name, 'i') }) // Case insensitive
}

// Chainable with a query
userSchema.query.byName = function(name) {
    return this.where({ name: new RegExp(name, 'i') }) // Case insensitive
}

// Property not on the schema itself, but based on others that are
userSchema.virtual('namedEmail').get(function() {
    return `${this.name} <${this.email}>`
})



// Middleware (pre | post)
// remove, validate, save...
userSchema.pre('save', function(next) {
    this.updatedAt = Date.now()
    next()
})

userSchema.post('save', function(doc, next) { // Saved doc, next action
    console.log(`I've been saved! (ref: ${doc._id})`)
    next()
})



module.exports = mongoose.model('User', userSchema) // User collection
