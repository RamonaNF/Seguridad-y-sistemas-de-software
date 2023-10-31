//
//  PokemonDetailView.swift
//  Pokedex
//
//  Created by Ramona NF on 30/10/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct PokemonDetailView: View {
    var pokemonBase: PokemonBase
    
    var body: some View {
        VStack {
            WebImage(url: URL(string: pokemonBase.perfil?.sprites.front_default ?? ""))
                .resizable()
                .scaledToFit()
                .frame(width: 48, height: 48, alignment: .center)
            
            Spacer(minLength: 16)
            
            Text(pokemonBase.pokemon.name)
                .font(.largeTitle)
        }.padding()
    }
}
