//
//  ContentView.swift
//  Pokedex
//
//  Como usuario quiero ver el detalle de un Pokemon
//
//  Created by Ramona NF on 07/10/23.
//

import SwiftUI
import SDWebImageSwiftUI // WebImage

struct ContentView: View {
    @StateObject var contentViewModel = ContentViewModel() // Vigilar el estado de una variable observable
    
    var body: some View {
        NavigationView {
            List(contentViewModel.pokemonList) { // Arreglo de datos sobre el que iterar
                pokemonBase in NavigationLink { // Para definir la vista destino
                    PokemonDetailView(pokemonBase: pokemonBase)
                } label: {
                    HStack { // Contenedor horizontal
                        WebImage(url: URL(string: pokemonBase.perfil?.sprites.front_default ?? ""))
                           .resizable() // Resizable like SwiftUI.Image, you must use this modifier or the view will use the image bitmap size
                           .scaledToFit()
                           .frame(width: 48, height: 48, alignment: .center)
                        Text(pokemonBase.pokemon.name)
                    }
                }
            }
        }.onAppear { // OJO: No soporta concurrencia (tareas de forma simultánea)
            Task {
                await contentViewModel.getPokemonList()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
