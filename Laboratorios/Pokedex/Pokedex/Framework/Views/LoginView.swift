//
//  LoginView.swift
//  Pokedex
//
//  Created by Ramona NF on 18/10/23.
//

import SwiftUI

struct LoginView: View {
    @StateObject var loginViewModel = LoginViewModel()
    
    let goMenu: () -> Void // Para coordinar el flujo de navegación
    
    var body: some View {
        VStack(alignment: .center) {
            Spacer().frame(height: 48)
            
            Text("Pokedex")
                .font(.largeTitle)
            
            Spacer()
            
            VStack(spacing: 0) { // TextField con línea debajo de él
                TextField(text: $loginViewModel.email) {
                    Text("Correo electrónico")
                }.multilineTextAlignment(.center)
                 .keyboardType(.emailAddress)
                 .padding()
                 .font(.title3)
                 .textInputAutocapitalization(.never)
                
                Divider()
            }
            
            Spacer()
            
            Button {
                loginViewModel.setCurrentUser()
                goMenu() // Ejecuta el coordinator
            } label: {
                Text("Acceder")
            }
        }.onAppear{
            loginViewModel.getCurrentUser()
            
            if loginViewModel.email != "" {
                goMenu()
            }
         }.padding()
         .alert(isPresented: $loginViewModel.showAlert) {
            Alert(
                title: Text("Oops!"),
                message: Text(loginViewModel.messageAlert)
            )
         }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView {()}
    }
}
