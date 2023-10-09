//
//  Pokedex.swift
//  Pokedex
//
//  Created by Ramona NF on 08/10/23.
//

import Foundation

struct Pokedex {
    var count: Int
    var results: [Pokemon] // Decoding JSON's srray
}                          // Debe mapearse con variables primitivas

struct Pokemon {
    var name: String
    var url: String
}

struct Perfil {
    var sprites: Sprite
}

struct Sprite {
    var front_default: String
    var back_default: String
}

struct PokemonBase: Identifiable { // Protocolo para identificar celdas
    var id: Int                    // Requiere de una propiedad que las mantenga únicas
    var pokemon: Pokemon
    var perfil: Perfil
}
