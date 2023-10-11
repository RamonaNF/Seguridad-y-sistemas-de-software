//
//  PokemonAPIProtocol.swift
//  Pokedex
//
//  PASO 1: Protocolo del servicio de API
//  Mapear API (conexiones, URLs necesarias) -> BAAS (backend as a service)
//
//  Created by Ramona NF on 09/10/23.
//

import Foundation

protocol PokemonAPIProtocol {
    // POST: body de la petición HTTP (decodificado dentro del paquete)
    // GET: query como parámetro
    
    // async func: porque el método podría tomar mucho tiempo en devolver la información
    
    // https://pokeapi.co/api/v2/pokemon?limit=1279 -> Query param: ?param1=val1&paramN=valN
    func getPokemonList(limit: Int) async -> Pokedex? // ? Podría devolver null
    
    // https://pokeapi.co/api/v2/pokemon/11/ -> Query param: /numPokemon/
    func getPokemonInfo(numberPokemon:Int) async -> Perfil?
}
