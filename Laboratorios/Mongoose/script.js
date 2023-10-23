
// Reference: https://www.youtube.com/watch?v=DZBGEVgL2eE

// npm init -y
// npm i mongoose
// npm i --save-dev nodemon

// package.json -> "devStart": "nodemon script.js"
// npm run devStart

const mongoose = require('mongoose')
const User = require('./User') // Require file with user model


mongoose.connect('mongodb://localhost/testdb')
    .then(() => {
        console.log('Connected')
    })
    .catch(e => console.error(e))

// SCHEMA: what the structure of your data looks like
// MODEL: schema in use (collection)
// QUERY

run()


async function run() {
    await User.deleteMany({})

    // Option 1
    const author = new User({ 
        name: "RNF",
        age: 20,

        hobbies: ["Weight lifting"],
        address: {
            city: "Querétaro"
        }
    })
    author.name = "Ramona NF"

    await author.save()
    console.log(author)

    // Option 2
    const user = await User.create({ 
        name: "Romi",
        age: 17, 
        email: "TEST@TeSt.CoM"
    })
    
    console.log(user)


    try { // Recommended to validate an object's creation
        const test = await User.create({ age: "Can't tell :O" })
    } catch(e) {
        console.error(e.message)
        //console.error(e.errors.age)
    }

    author.name = "DateTest"
    //author.age = 150 // Descomentar para ver el error
    //author.email = "a@jaj.com" // Descomentar para ver el error
    
    // Intercambiar para ver el error
    //author.oddLuckyNum = 10
    author.oddLuckyNum = 11

    author.bestFriend = user._id

    // Immutable
    author.createdAt = "1234-05-06T12:34:56.789Z"
    // Mutable
    author.updatedAt = "1234-05-06T12:34:56.789Z"

    await author.save()
    console.log(author)



    if (await User.exists({ name: {$eq: "DateTest"} })) {
        const someUser = await User.findById( (await User.findOne({ name: "DateTest" }, {_id: 1}))._id )
        console.log('SOME USER...')
        someUser.sayHi()
    }

    await User.deleteOne({ age: {$lt: 18} }) // Returns {deletedCount: x}

    // QUERIES: Retornan una lista
    // .where()  .equals() | .gt() | .lt() | .limit()     .populate()     .select()
    const update = (await User.where("name").equals("DateTest").populate("bestFriend"))[0]
    update.name = "Ramonaa :D"
    await update.save()
    console.log(update)

    const oddLuckyNums = await User.where("age").gt(17).lt(29).select("oddLuckyNum")
    console.log(`Today's lucky numbers areee... ${oddLuckyNums}`)

    console.log('Bye byeee')
    
    const info = await User.findOne().byName("RaMoNaA :d")
    console.log(info.namedEmail)

    // Equivalencias
    //console.log(await User.findByName("RaMoNaA :d"))
    //console.log(await User.find().byName("RaMoNaA :d"))
    //console.log(await User.where().byName("RaMoNaA :d"))
}
