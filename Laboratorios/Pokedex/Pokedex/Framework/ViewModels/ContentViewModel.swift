//
//  ContentViewModel.swift
//  Pokedex
//
//  Created by Ramona NF on 14/10/23.
//

import Foundation

class ContentViewModel: ObservableObject { // Emite cambios de sus valores
    @Published var pokemonList = [PokemonBase]() // Notifica cambios al ContentView
    
    var pokemonListRequirement: PokemonListRequirementProtocol
    var pokemonInfoRequirement: PokemonInfoRequirementProtocol

    init(pokemonListRequirement: PokemonListRequirementProtocol = PokemonListRequirement.shared, pokemonInfoRequirement: PokemonInfoRequirementProtocol = PokemonInfoRequirement.shared) {
        self.pokemonListRequirement = pokemonListRequirement
        self.pokemonInfoRequirement = pokemonInfoRequirement
    }
    
    @MainActor // Singleton del OS para que un método corra en el mainQueue
    func getPokemonList() async {
        let pokemonRepository = PokemonRepository()
        
        let result = await pokemonRepository.getPokemonList(limit: 20)
        //print("Pokedex count: \(result!.count)")
        
        for i in 0...result!.results.count-1 {
            //let numberPokemon = Int(pokemon.url.split(separator: "/")[5])!
            
            let tempPerfil = await pokemonInfoRequirement.getPokemonInfo(numberPokemon: i+1)
            let tempPokemon = PokemonBase(id: i+1, pokemon: result!.results[i], perfil: tempPerfil)
            
            self.pokemonList.append(tempPokemon)
        }
    }
}
