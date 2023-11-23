//
//  ContentRepository.swift
//  Practica
//
//  Created by Ramona NF on 22/11/23.
//

import Foundation

//  Protocolo del servicio de API
protocol MovieAPIProtocol { //  Mapear API (conexiones, URLs necesarias) -> BAAS (backend as a service)
    // POST: body de la petición HTTP (decodificado dentro del paquete)
    // GET: query como parámetro
    
    // async func: porque el método podría tomar mucho tiempo en devolver la información
    
    // https://api.themoviedb.org/3/movie/popular?api_key=MYAPIKEY
    func getPopularMovies() async -> MovieResponse? // ? Podría devolver null
}


// Rutas
struct Api {
    static let base = "https://api.themoviedb.org/3/movie/" // URL base
    
    struct routes {
        static let popular = "/popular" // Módulo de la API
    }
}


class MovieRepository: MovieAPIProtocol { // Se hereda del protocolo
    let nservice: NetworkAPIService // Uso del singleton
    static let shared = MovieRepository()
    
    // Para que en cada acceso al repo por default se use el singleton de nuestra API
    init(nservice: NetworkAPIService = NetworkAPIService.shared) { // Asigna parámetro por default
        self.nservice = nservice
    }
    
    func getPopularMovies() async -> MovieResponse? {
        return await nservice.getAPIinfo(url: URL(string:"\(Api.base)\(Api.routes.popular)")!)
    }
}
