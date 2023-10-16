//
//  PokemonInfoRequirement.swift
//  Pokedex
//
//  Como usuario quiero tener la información de 1 Pokemon para ver todo su detalle
//
//  Created by Ramona NF on 15/10/23.
//

import Foundation

protocol PokemonInfoRequirementProtocol {
    func getPokemonInfo(numberPokemon: Int) async -> Perfil?
}

class PokemonInfoRequirement: PokemonInfoRequirementProtocol {
    static let shared = PokemonInfoRequirement() // Singleton
    let dataRepository: PokemonRepository  // Uso de un singleton

    init(dataRepository: PokemonRepository = PokemonRepository.shared) {
        self.dataRepository = dataRepository
    }
    
    func getPokemonInfo(numberPokemon: Int) async -> Perfil? {
        return await dataRepository.getPokemonInfo(numberPokemon: numberPokemon)
    }
}
