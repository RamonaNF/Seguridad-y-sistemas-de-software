//
//  ContentView.swift
//  Practica
//
//  Created by Ramona NF on 22/11/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var contentViewModel = ContentViewModel() // Vigilar el estado de una variable observable
    
    var body: some View {
        VStack {
            List(contentViewModel.popularMoviesList) { // Arreglo de datos sobre el que iterar
                popularMovie in MovieCard(movie: popularMovie)
            }
        }.onAppear { // OJO: No soporta concurrencia (tareas de forma simultánea)
            Task {
                await contentViewModel.getPopularMovies()
            }
        }
    }
}

/*struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}*/
