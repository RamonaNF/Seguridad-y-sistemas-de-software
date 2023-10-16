//
//  ContentView.swift
//  LabInterfaces
//
//  Created by Ramona NF on 12/10/23.
//

import SwiftUI // Componentes gráficos y sus propiedades

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Personal Info")
                .font(.largeTitle) // Tamaños default de iOS
                .frame(maxWidth: .infinity, alignment: .leading) // (Respecto al contenedor padre, .leading | .center | .trailing)
            
            Spacer().frame(height: 50)
            
            ZStack { // Ordenar componentes en el eje z
                Image("Profile")
                    .resizable() // Para poder cambiar el tamaño de la imagen
                    .scaledToFit() // css: aspect-fit
                    .frame(width: .infinity, height: 100)
                    .clipShape(Circle())
                    .padding(.top, -150)
                    .zIndex(1) // Posición en el plano
                
                GroupBox {
                    Spacer().frame(height: 80)
                    
                    Text("Ramona Nájera")
                        .font(.title)
                        .frame(maxWidth: .infinity)
                    
                    Text("iOS developer")
                        .font(.title2)
                        .frame(maxWidth: .infinity)
                    
                    HStack(spacing: 0) { // Espacio entre elementos
                        Group { // Para asignarles las mismas propiedades
                            Circle()
                                .fill(.green)
                                .cornerRadius(3.0) // Radio
                                .frame(width: 10, height: 10) // Tamaño
                            
                            Text("Online")
                                .foregroundColor(.green)
                        }.padding([.top, .bottom], 8)
                         .padding([.leading, .trailing], 16)
                    } .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.green, lineWidth: 3)
                    ).padding(.top, 20)
                    
                    Spacer().frame(height: 24)
                }.clipShape(
                    RoundedRectangle(cornerSize: CGSize(width: 20, height:10))
                ).overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.gray, lineWidth: 1)
                ).zIndex(0) // Posición que estamos buscando
            }
        }.padding() // Márgenes para todo el contenedor
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
