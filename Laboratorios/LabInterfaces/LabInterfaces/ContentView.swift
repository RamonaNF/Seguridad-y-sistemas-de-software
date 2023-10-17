//
//  ContentView.swift
//  LabInterfaces
//
//  Created by Ramona NF on 12/10/23.
//

import SwiftUI // Componentes gráficos y sus propiedades

struct ContentView: View {
    @State var value = ""
    @State var toggleValue: [Bool] = [false, false, false]
    @State var pickerValue = false
    
    var body: some View {
        ScrollView {
            VStack {
                Group {
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
                        }.clipShape(
                            RoundedRectangle(cornerSize: CGSize(width: 20, height:10))
                        ).overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.gray, lineWidth: 1)
                        ).zIndex(0) // Posición que estamos buscando
                    }
                    
                    Spacer().frame(height: 24)
                    
                    HStack(spacing: 32) {
                        Button {
                            print("Messsage")
                        } label: {
                            Image(systemName: "message.fill")
                                .resizable()
                                .tint(.red)
                                .frame(width: 24, height: 24)
                                .padding(16)
                                .background(Color(UIColor(red: 1, green: 0, blue: 0, alpha: 0.2)))
                                .clipShape(Circle())
                                .overlay(
                                    Circle()
                                        .stroke(Color.red, lineWidth: 1)
                                )
                        }
                        
                        Button {
                            print("Phone call")
                        } label: {
                            Image(systemName: "phone.fill")
                                .resizable()
                                .tint(.green)
                                .frame(width: 24, height: 24)
                                .padding(16)
                                .background(Color(UIColor(red: 0, green: 1, blue: 0, alpha: 0.2)))
                                .clipShape(Circle())
                                .overlay(
                                    Circle()
                                        .stroke(Color.green, lineWidth: 1)
                                )
                        }
                        
                        Button {
                            print("Video chat")
                        } label: {
                            Image(systemName: "video.fill")
                                .resizable()
                                .tint(.blue)
                                .scaledToFill()
                                .frame(width: 24, height: 24)
                                .padding(16)
                                .background(Color(UIColor(red: 0, green: 0, blue: 1, alpha: 0.2)))
                                .clipShape(Circle())
                                .overlay(
                                    Circle()
                                        .stroke(Color.blue, lineWidth: 1)
                                )
                        }
                    }
                }
                
                Group {
                    Spacer().frame(height: 26)
                    
                    Button {
                        print("Info")
                    } label: {
                        Text("INFO")
                            .frame(maxWidth: .infinity)
                            .padding(10)
                            .foregroundColor(.gray)
                            .background(Color(UIColor.systemGray6))
                            .overlay(
                                Capsule()
                                    .stroke(Color(UIColor.systemGray), lineWidth: 1)
                            )
                    }.clipShape(Capsule())
                     .disabled(true)
                    
                    Form(content: {
                        Section(header: Text("First Name")) {
                            TextField("First", text: $value)
                        }
                        
                        Section(header: Text("Last Name")) {
                            TextField("Last", text: $value)
                        }
                    }).frame(height: 220)
                    
                    Spacer().frame(height: 26)
                }
                
                Group {
                    Button {
                        print("Notifications")
                    } label: {
                        Text("NOTIFICATIONS")
                            .padding(10)
                            .foregroundColor(Color.gray)
                            .frame(maxWidth: .infinity)
                            .background(Color(UIColor.systemGray6))
                            .overlay(
                                Capsule()
                                    .stroke(Color(UIColor.systemGray), lineWidth: 1)
                            )
                    }.clipShape(Capsule())
                     .disabled(true)
                    
                    VStack(spacing: 20) {
                        Spacer().frame(height: 15)

                        // Componente de switch y toggle
                        Toggle(isOn: $toggleValue[0]) {
                            // Texto del componente
                            Text("In-app notifications")
                        }

                        Divider() // Línea divisora entre los toggle

                        Toggle(isOn: $toggleValue[1]) {
                            Text("Call")
                        }

                        Divider()

                        Toggle(isOn: $toggleValue[2]) {
                            Text("Screen Share")
                        }
                    }
                }
                
                Spacer().frame(height: 26)
                
                Button {
                    print("Language")
                } label: {
                    Text("LANGUAGE")
                        .padding(10)
                        .foregroundColor(Color.gray)
                        .frame(maxWidth: .infinity)
                        .background(Color(UIColor.systemGray6))
                        .overlay(
                            Capsule()
                                .stroke(Color(UIColor.systemGray), lineWidth: 1)
                        )
                }.clipShape(Capsule())
                 .disabled(true)
                
                Picker(selection: $pickerValue) {
                    // Se almacena el valor del tag
                    Text("Spanish").tag(0)
                    Text("English").tag(1)
                    Text("Italian").tag(2)
                } label: {
                    Text("English")
                }
                
                Spacer().frame(height: 26)
                
                Button {
                    print("Log out")
                } label: {
                    HStack(content: {
                        Image(systemName: "togglepower")
                        Text("LOG OUT").bold()
                    }).foregroundColor(.purple)
                }.frame(maxWidth: .infinity)
                 .padding()
                 .border(Color.purple)
                 .padding(16)
                 
            }.padding() // Márgenes para todo el contenedor
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
