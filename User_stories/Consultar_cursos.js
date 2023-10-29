
// SERVICE S003
// "Consultar cursos"

// ROLES ASOCIADOS
// ["R001", "R002", "R003"]
// [User, Admin, Speaker]

const mongoose = require('mongoose')

const Course = require('./models/courses.model')
const Focus = require('./models/focus.model')
const CourseFocus = require('./models/courseFocus.model')



mongoose.connect('mongodb://localhost/RROtest')
    .then(() => {
        console.log('Connected')
    })
    .catch(e => console.error(e))



generateCoursesInfo()



async function generateCoursesInfo() {
    await Course.deleteMany({})
    await Focus.deleteMany({})
    await CourseFocus.deleteMany({})

    try { 
        const course1 = await Course.create(
            {
                "name": "Hablar con éxito",
                "description": "Comunica eficazmente, ¡genera confianza y credibilidad con tus palabras y lenguaje corporal!",
                "speaker": "Juanito Pérez",
                "startDate": "2023-10-27T17:00:00.000Z",
                "endDate": "2023-10-30T21:21:41.052Z",
                "schedule": "17:00",
                "modality": "Remoto",
                "location": "Zoom",
                "status": "De pago",
                "cost": 180,
                "courseImage": "",
                "capacity": 100,
                "rating": 0,
                "meetingCode": "",
                "accessCode": ""
            }
        )

        const course2 = await Course.create(
            {
                "name": "Empatía para la paz",
                "description": "Mirar con los ojos del otro",
                "speaker": "Dr. Fernándo González",
                "startDate": "2023-11-27T17:00:00.000Z",
                "endDate": "2023-11-30T21:21:41.052Z",
                "schedule": "11:00",
                "modality": "Presencial",
                "postalCode": 76000,
                "location": "Museo de los Conspiradores",
                "status": "Gratuito",
                "cost": 0,
                "courseImage": "",
                "capacity": 32,
                "rating": 5
            }
        )

        const course3 = await Course.create(
            {
                "name": "¿Cuánto cuesta la tranquilidad de tu familia?",
                "description": "Septiembre, mes del testamento",
                "speaker": "Alicia Mendoza",
                "startDate": "2023-12-27T17:00:00.000Z",
                "endDate": "2023-12-30T21:21:41.052Z",
                "schedule": "10:00",
                "modality": "Remoto",
                "location": "Meet",
                "status": "Gratuito",
                "cost": 0,
                "courseImage": "",
                "capacity": 101,
                "rating": 4,
                "meetingCode": "",
                "accessCode": ""
            }
        )

        const course4 = await Course.create(
            {
                "name": "Ética y ESR",
                "description": "Aprende a incorporar la ética al negocio",
                "speaker": "Laura Rochin",
                "startDate": "2024-01-27T17:00:00.000Z",
                "endDate": "2024-01-30T21:21:41.052Z",
                "schedule": "16:00",
                "modality": "Presencial",
                "postalCode": 76590,
                "location": "Fundación RRO",
                "status": "De pago",
                "cost": 578,
                "courseImage": "",
                "capacity": 46,
                "rating": 3
            }
        )

        /* 
        ------------ TEMPLATE COURSES ------------
        {
            "name": "",
            "description": "",
            "speaker": "",
            "startDate": ,
            "endDate": ,
            "schedule": "",
            "modality": "",   ---> ["Remoto", "Presencial"]
            "postalCode": ,
            "location": "",
            "status": "",   ---> ["Gratuito", "De pago"]
            "cost": ,
            "courseImage": "",
            "capacity": ,
            "rating": ,
            "meetingCode": "",
            "accessCode": ""
        }
        */
        




        const focus1 = await Focus.create(
            {
                "name": "Comunicación"
            }
        )

        const focus2 = await Focus.create(
            {
                "name": "Ciencias sociales"
            }
        )

        const focus3 = await Focus.create(
            {
                "name": "Psicología"
            }
        )

        const focus4 = await Focus.create(
            {
                "name": "Ética"
            }
        )

        const focus5 = await Focus.create(
            {
                "name": "ESR"
            }
        )

        /* 
        ------------ TEMPLATE FOCUS ------------
        {
            "name": ""
        }
        */





        const courseFocus1 = await CourseFocus.create(
            {
                "course": course1._id,
                "focus": focus1._id
            }
        )

        const courseFocus2 = await CourseFocus.create(
            {
                "course": course2._id,
                "focus": focus2._id
            }
        )

        const courseFocus3 = await CourseFocus.create(
            {
                "course": course3._id,
                "focus": focus3._id
            }
        )

        const courseFocus4 = await CourseFocus.create(
            {
                "course": course4._id,
                "focus": focus4._id
            }
        )

        const courseFocus5 = await CourseFocus.create(
            {
                "course": course4._id,
                "focus": focus5._id
            }
        )

        /* 
        ------------ TEMPLATE COURSE FOCUS ------------
        {
            "name": ""
        }
        */

    } catch(e) {
        console.error(e.message)
    }
}
