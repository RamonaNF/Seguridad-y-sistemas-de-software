//
//  ProfileView.swift
//  RRO
//
//  Modified by user326 on 14/11/23.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var myCoursesViewModel = MyCoursesViewModel() // Se crea una instancia del ViewModel
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "person")
                    .font(.largeTitle)
                
                Text("Perfil")
                    .font(.largeTitle)
                    .fontWeight(.black)
            }
            
            Text("Mis Cursos")
                .font(.largeTitle)
                .fontWeight(.black)
            
            ScrollView {
                ForEach(myCoursesViewModel.courseList) { course in
                    CourseInfoCardView(course: course) // Muestra una tarjeta de información del curso
                }
                
            }.onAppear {
                Task {
                    print("Solicitando info... 1")
                    await myCoursesViewModel.getMyCourses() // Llama al método
                    print("VIEW 1", myCoursesViewModel.courseList)
                }
            }
        }
    }
}
