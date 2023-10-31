//
//  ContentView.swift
//  RRO
//
//  Created by Ramona NF on 30/10/23.
//

import SwiftUI

struct ContentView: View {
    @State var coursesList: ServerResponse<[Course]>?
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
        let result = await courseRepository.getCourseList(cost: 0)
        
        coursesList = result
    }
    
    func getCourse() async {
        let courseRepository = CourseRepository()
        let result = await courseRepository.getCourse(id: "653de831b18d421bfc22c264")
        
        course = result
    }
}

/*struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}*/
