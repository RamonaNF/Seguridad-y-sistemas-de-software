//
//  PokemonListRequirement.swift
//  Pokedex
//
//  Como usuario quiero ver la lista de Pokemon para poder seleccionar y ver el detalle de alguno
//
//  Created by Ramona NF on 15/10/23.
//

import Foundation

protocol PokemonListRequirementProtocol {
    func getPokemonList(limit: Int) async -> Pokedex?
}

class PokemonListRequirement: PokemonListRequirementProtocol {
    static let shared = PokemonListRequirement() // Singleton
    let dataRepository: PokemonRepository // Uso de un singleton

    init(dataRepository: PokemonRepository = PokemonRepository.shared) {
        self.dataRepository = dataRepository
    }
    
    func getPokemonList(limit: Int) async -> Pokedex? {
        return await dataRepository.getPokemonList(limit: limit)
    }
}
