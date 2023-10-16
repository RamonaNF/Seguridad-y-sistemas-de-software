//
//  ContentView.swift
//  Pokedex
//
//  Created by Ramona NF on 07/10/23.
//

import SwiftUI
import SDWebImageSwiftUI // WebImage

struct ContentView: View {
    @StateObject var contentViewModel = ContentViewModel() // Vigilar el estado de una variable observable
    
    var body: some View {
        List(contentViewModel.pokemonList) { // Arreglo de datos sobre el que iterar
            pokemonBase in HStack { // Contenedor horizontal
                WebImage(url: URL(string: pokemonBase.perfil?.sprites.front_default ?? ""))
                   .resizable() // Resizable like SwiftUI.Image, you must use this modifier or the view will use the image bitmap size
                   .scaledToFit()
                   .frame(width: 48, height: 48, alignment: .center)
                Text(pokemonBase.pokemon.name)
            }
        }.onAppear { // OJO: No soporta concurrencia (tareas de forma simultánea)
            Task {
                await contentViewModel.getPokemonList()
            }
        }
    }
}
