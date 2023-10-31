//
//  UserRequirement.swift
//  Pokedex
//
//  Como usuario quiero iniciar sesión con mi correo antes de usar la app para que mi sesión quede guardada
//
//  Created by Ramona NF on 18/10/23.
//

import Foundation

protocol UserRequirementProtocol {
    func getCurrentUser() -> String?
    func setCurrentUser(email: String)
    func removeCurrentUser()
}

class UserRequirement: UserRequirementProtocol {
    static let shared  = UserRequirement()
    let dataRepository: UserRepository
    
    init(dataRepository: UserRepository = UserRepository.shared) {
        self.dataRepository = dataRepository
    }
    
    func getCurrentUser() -> String? {
        return dataRepository.getCurrentUser()
    }
    
    func setCurrentUser(email: String) {
        return dataRepository.setCurrentUser(email: email)
    }
    
    func removeCurrentUser() {
        return dataRepository.removeCurrentUser()
    }
}
