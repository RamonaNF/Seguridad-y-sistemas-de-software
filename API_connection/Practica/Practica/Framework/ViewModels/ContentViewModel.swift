//
//  ContentViewModel.swift
//  Practica
//
//  Created by Ramona NF on 22/11/23.
//

import Foundation

class ContentViewModel: ObservableObject { // Emite cambios de sus valores
    @Published var popularMoviesList = [Movie]() // Notifica cambios al ContentView
    
    var popularMoviesRequirement: PopularMoviesRequirement

    init(popularMoviesRequirement: PopularMoviesRequirement = PopularMoviesRequirement.shared) {
        self.popularMoviesRequirement = popularMoviesRequirement
    }
    
    @MainActor // Singleton del OS para que el método corra en el mainQueue
    func getPopularMovies() async {
        let result = await popularMoviesRequirement.getPopularMovies()
        
        for i in 0...result!.results.count-1 {
            self.popularMoviesList.append(result!.results[i])
        }
    }
}
