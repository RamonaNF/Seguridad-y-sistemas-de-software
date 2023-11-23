//
//  ContentRequirement.swift
//  Practica
//
//  Created by Ramona NF on 22/11/23.
//

import Foundation

protocol PopularMoviesRequirementProtocol {
    func getPopularMovies() async -> MovieResponse?
}

class PopularMoviesRequirement: PopularMoviesRequirementProtocol {
    static let shared = PopularMoviesRequirement() // Singleton
    let dataRepository: MovieRepository // Uso de un singleton

    init(dataRepository: MovieRepository = MovieRepository.shared) {
        self.dataRepository = dataRepository
    }
    
    func getPopularMovies() async -> MovieResponse? {
        return await dataRepository.getPopularMovies()
    }
}
