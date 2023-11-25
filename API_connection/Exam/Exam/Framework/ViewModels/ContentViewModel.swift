//
//  ContentViewModel.swift
//  Exam
//
//  Created by Ramona NF on 23/11/23.
//

import Foundation

class ContentViewModel: ObservableObject { // Emite cambios de sus valores
    //@Published var popularMoviesList = [Movie]() // Notifica cambios al ContentView
    
    var dataRequirement: DataRequirement

    init(dataRequirement: DataRequirement = DataRequirement.shared) {
        self.dataRequirement = dataRequirement
    }
    
    @MainActor // Singleton del OS para que el método corra en el mainQueue
    func getPopularMovies() async {
        let result = await dataRequirement.getData()
        
        /*for i in 0...result!.results.count-1 {
            self.popularMoviesList.append(result!.results[i])
        }*/
    }
}
