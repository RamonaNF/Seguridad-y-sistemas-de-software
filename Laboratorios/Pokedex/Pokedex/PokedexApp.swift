//
//  PokedexApp.swift
//  Pokedex
//
//  Archivo principal del proyecto...
//  Descripción del contenido y el comportamiento de la aplicación
//
//  Created by Ramona NF on 07/10/23.
//

import SwiftUI

@main // Indica que es el punto de entrada del proyecto
struct PokedexApp: App {
    // Property wrapper: Lee los valores de ambiente de una vista
    // https://developer.apple.com/documentation/swiftui/environmentvalues
    @Environment(\.scenePhase) var scenePhase // Al cambiar se ejecuta la acción definida
    
    var body: some Scene { // Regresa el contenido de la app como una Scene
                           // i.e. Vistas de la interfaz final compuestas por una jerarquía
        WindowGroup { // Window Group: Múltiples escenas
                      // Window: No modo background (solo en macOS)
                      // Document Group: CRUD de documentos
                      // Settings: Abrir menú settings desde la app (solo en macOS)
            ContentView()
            
        }.onChange(of: scenePhase) {
            
            (newScenePhase) in switch newScenePhase {
                case .background:
                    print("App State : Background")
                
                case .inactive:
                    print("App State : Inactive")
                
                case .active: // Foreground
                    print("App State : Active")
                
                @unknown default:
                     print("App State : Unknown")
            }
        }
    }
}
