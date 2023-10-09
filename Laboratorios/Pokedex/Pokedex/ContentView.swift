//
//  ContentView.swift
//  Pokedex
//
//  Created by Ramona NF on 07/10/23.
//

import SwiftUI
import SDWebImageSwiftUI // WebImage

struct ContentView: View {
    @State var pokemonList = [PokemonBase]() // Vigilar el estado de una variable
    
    var body: some View {
        //Text("Hello, world!")
        //    .padding()
        List(pokemonList) { // Arreglo de datos sobre el que iterar
            pokemonBase in HStack { // Contenedor horizontal
                WebImage(url: URL(string: pokemonBase.perfil.sprites.front_default))
                   .resizable() // Resizable like SwiftUI.Image, you must use this modifier or the view will use the image bitmap size
                   .scaledToFit()
                   .frame(width: 48, height: 48, alignment: .center)
                Text(pokemonBase.pokemon.name)
            }
        }
    }
}

// Datos prueba
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let pokemon = Pokemon(name: "bulbasaur", url: "")
        let pokemon2 = Pokemon(name: "charmander", url: "")
        let pokemon3 = Pokemon(name: "squirtle", url: "")
        
        let perfil = Perfil(sprites: Sprite(front_default: "https://assets.pokemon.com/assets/cms2/img/pokedex/full/001.png", back_default: ""))
        let perfil2 = Perfil(sprites: Sprite(front_default: "https://assets.pokemon.com/assets/cms2/img/pokedex/full/004.png", back_default: ""))
        let perfil3 = Perfil(sprites: Sprite(front_default: "https://assets.pokemon.com/assets/cms2/img/pokedex/full/007.png", back_default: ""))

        let pokemonBase = PokemonBase(id: 1, pokemon: pokemon, perfil: perfil)
        let pokemonBase2 = PokemonBase(id: 2, pokemon: pokemon2, perfil: perfil2)
        let pokemonBase3 = PokemonBase(id: 3, pokemon: pokemon3, perfil: perfil3)

        let pokemonLst : [PokemonBase] = [pokemonBase, pokemonBase2, pokemonBase3]
        
        Group {
            ContentView(pokemonList: pokemonLst)
        }
    }
}
