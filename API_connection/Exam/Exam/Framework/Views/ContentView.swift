//
//  ContentView.swift
//  Exam
//
//  Created by Ramona NF on 23/11/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var contentViewModel = ContentViewModel() // Vigilar el estado de una variable observable
    
    var body: some View {
        VStack {
            /*List(contentViewModel.dataList) { // Arreglo de datos sobre el que iterar
                info2 in ContentCard(info: info2)
            }*/
        }.onAppear { // OJO: No soporta concurrencia (tareas de forma simultánea)
            Task {
                //await contentViewModel.getData()
            }
        }
    }
}

/*struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}*/
