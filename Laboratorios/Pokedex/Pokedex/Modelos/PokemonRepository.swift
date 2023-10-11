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

// Rutas
struct Api {
    static let base = "https://pokeapi.co/api/v2/" // URL base
    
    struct routes {
        static let pokemon = "/pokemon" // Módulo de la API
    }
}

class PokemonRepository: PokemonAPIProtocol { // Se hereda del protocolo
    let nservice: NetworkAPIService // PASO 5: Uso del singleton
    
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
