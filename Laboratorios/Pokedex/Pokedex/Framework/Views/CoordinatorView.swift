//
//  CoordinatorView.swift
//  Pokedex
//
//  Como usuario quiero elegir entre ver la lista del Pokedex o mi perfil
//
//  Created by Ramona NF on 29/10/23.
//

import SwiftUI
import FlowStacks
import SDWebImageSwiftUI // WebImage

struct CoordinatorView: View { // Vista para el manejo del flujo de navegación
    @State var routes: Routes<Screen> = [.root(.login)] // Página principal
    
    enum Screen { // Vistas de la aplicación
        case login
        case menu
    }
    
    var body: some View {
        Router($routes) {
            
            screen, _ in switch screen { // Se asigna la vista que le corresponde a cada pantalla
                case .login:
                    LoginView(
                        goMenu: { // Acción para presentar otra pantalla
                            routes.presentCover(.menu) // Flujo: route screen + presenting mode
                        })
                
                case .menu:
                    MenuView(goRoot: { routes.presentCover(.login) })
            }
        }
    }
    
    private func goRoot() { // Regresa a la pantalla principal
        Task { // Regresando a la primera pantalla en el flujo
            @MainActor in await $routes.withDelaysIfUnsupported {
                $0.goBackToRoot()
            }
        }
    }
}
