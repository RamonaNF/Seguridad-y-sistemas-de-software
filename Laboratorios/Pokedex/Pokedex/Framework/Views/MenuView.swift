//
//  MenuView.swift
//  Pokedex
//
//  Created by Ramona NF on 29/10/23.
//

import SwiftUI
import SDWebImageSwiftUI // WebImage

struct MenuView: View {
    let goRoot: () -> Void // Para coordinar el flujo de navegación
    
    var body: some View {
        TabView {
            ContentView().tabItem {
                Image(systemName: "cricket.ball.fill")
                Text("Pokedex")
            }
            
            PerfilView(goRoot: goRoot).tabItem {
                Image(systemName: "person")
                Text("Perfil")
            }
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView {()}
    }
}
