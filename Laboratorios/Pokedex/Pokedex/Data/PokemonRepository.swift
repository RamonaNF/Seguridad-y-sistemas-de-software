//
//  PokemonRepository.swift
//  Pokedex
//
//  PASO 2: Patrón de diseño Repository (de llamadas)
//  Conexión con el protocol para cargar los datos hacia el ContentView
//
//  Created by Ramona NF on 09/10/23.
//

import Foundation

//  PASO 1: Protocolo del servicio de API
protocol PokemonAPIProtocol { //  Mapear API (conexiones, URLs necesarias) -> BAAS (backend as a service)
    // POST: body de la petición HTTP (decodificado dentro del paquete)
    // GET: query como parámetro
    
    // async func: porque el método podría tomar mucho tiempo en devolver la información
    
    // https://pokeapi.co/api/v2/pokemon?limit=1279 -> Query param: ?param1=val1&paramN=valN
    func getPokemonList(limit: Int) async -> Pokedex? // ? Podría devolver null
    
    // https://pokeapi.co/api/v2/pokemon/11/ -> Query param: /numPokemon/
    func getPokemonInfo(numberPokemon:Int) async -> Perfil?
}

// Rutas
struct Api {
    static let base = "https://pokeapi.co/api/v2/" // URL base
    
    struct routes {
        static let pokemon = "/pokemon" // Módulo de la API
    }
}

class PokemonRepository: PokemonAPIProtocol { // Se hereda del protocolo
    let nservice: NetworkAPIService
    static let shared = PokemonRepository() // PASO 5: Uso del singleton
    
    // Para que en cada acceso al repo por default se use el singleton de nuestra API
    init(nservice: NetworkAPIService = NetworkAPIService.shared) { // Asigna parámetro por default
        self.nservice = nservice
    }
    
    func getPokemonList(limit: Int) async -> Pokedex? {
        return await nservice.getPokedex(url: URL(string:"\(Api.base)\(Api.routes.pokemon)")!, limit: limit)
    }
    
    func getPokemonInfo(numberPokemon: Int) async -> Perfil? {
        return await nservice.getPokemon(url: URL(string:"\(Api.base)\(Api.routes.pokemon)/\(numberPokemon)")!)
    }
}
