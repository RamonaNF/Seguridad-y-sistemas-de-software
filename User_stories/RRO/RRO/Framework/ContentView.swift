//
//  ContentView.swift
//  RRO
//
//  Created by Ramona NF on 30/10/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var myCoursesViewModel = MyCoursesViewModel() // Se crea una instancia del ViewModel
    
    // Pruebas ----------------------
    let endDate = Date.now.addingTimeInterval(5000)
    // ----------------------
    
    let now:Date = Date.now
    @State var rate:Bool = false
    @State var images:[String] = ["", "", "", "", ""]
    
    var body: some View {
        // Pruebas ----------------------
        Text("NOW \(now)")
        // ----------------------
        
        // TODO: Format endDate test
        
        if (now == now /*>= endDate*/) { // Validar que el curso haya empezado y no se haya calificado ya
            if(rate) { // Solicitar valoración
                
                HStack (spacing: 0) {
                    Text("Califica el curso")
                        .foregroundStyle(.secondary)
                    
                    Spacer()
                    
                    Group { // Botones de estrellas
                        ForEach(0..<images.count) {
                            i in Button { // Monitoreamos el rating seleccionado
                                myCoursesViewModel.userRating.rating = i + 1
                                updateStars()
                            } label: {
                                Image(systemName: "star\(images[i])")
                                    .foregroundColor(.yellow)
                            }.frame(height: 4)
                        }
                    }
                }.padding()
                 .onAppear { // Guardamos el curso a calificar
                     myCoursesViewModel.userRating.id = "6552624c9ee0c5765d52f10c"
                 }

                
                Button {
                    Task { // Mandamos el rating seleccionado
                        print("TODO: Update rating \n Course: \(myCoursesViewModel.userRating.id) \n Rating: \(myCoursesViewModel.userRating.rating)")
                        await myCoursesViewModel.updateCourseRating()
                        print("DONE!")
                        rate = false
                    }
                } label: {
                    Text("Enviar valoración")
                        .foregroundStyle(.secondary)
                }.buttonStyle(.borderedProminent)
                 .tint(.red)
                 .foregroundStyle(Color.white)
                
            } else {
                
                Button {
                    Task{ // Inicializamos el rating a 0
                        rate = true
                        myCoursesViewModel.userRating.rating = 0
                        updateStars()
                    }
                } label: {
                    Text("Calificar curso")
                        .foregroundStyle(.secondary)
                }.buttonStyle(.borderedProminent)
                 .tint(.red)
                 .foregroundStyle(Color.white)
                
            }
        }
    }
    
    func updateStars() {
        for i in 0..<myCoursesViewModel.userRating.rating { // Estrellas seleccionadas
            self.images[i] = ".fill"
        }
        for i in myCoursesViewModel.userRating.rating..<5 {
            self.images[i] = ""
        }
    }
    
    /*var body: some View {
        if (now < soon) {
            Text("HOLA AL FUTUROOO")
        } else {
            Text("HOLA DESDE AHORAA")
        }
    }*/
    
    /*@State var coursesList: ServerResponse<[Course]>?
    @State var course: ServerResponse<[Course]>?
    
    var body: some View {
        VStack {
            Text("Test info")
                .font(.largeTitle)
            
            Text("\nStatus: \(coursesList?.status ?? "")")
                .font(.body)
            
            let tst = (coursesList?.data ?? [])
            if (tst.count > 0) {
                List(tst) {
                    t in VStack {
                        Text("Name: \(t.name)")
                        Text("id: \(t.id)")
                    }
                }
            }
            
        }.onAppear {
            Task {
                await getCourseList()
            }
        }
        
        Spacer(minLength: 8)
        
        VStack {
            Text("One test")
                .font(.largeTitle)
            
            Text("\nStatus: \(course?.status ?? "")")
                .font(.body)
            
            let tst = (course?.data ?? [])
            if (tst.count > 0) {
                Text("Name: \(tst[0].name)")
                Text("description: \(tst[0].description)")
            }
            
        }.onAppear {
            Task {
                await getCourse()
            }
        }
        
        Spacer(minLength: 4)
    }
    
    func getCourseList() async {
        let courseRepository = CourseRepository()
        let result = await courseRepository.getCourseList(/*cost: 0*/)
        
        coursesList = result
    }
    
    func getCourse() async {
        let courseRepository = CourseRepository()
        let result = await courseRepository.getCourse(id: "653de831b18d421bfc22c264")
        
        course = result
    }*/
}

/*struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}*/
