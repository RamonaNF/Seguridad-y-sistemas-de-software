//
//  UserRepository.swift
//  Pokedex
//
//  Created by Ramona NF on 18/10/23.
//

import Foundation

// Protocolo del servicio local
protocol UserLocalProtocol {
    func getCurrentUser() -> String?
    func setCurrentUser(email: String)
    func removeCurrentUser()
}

class UserRepository: UserLocalProtocol {
    static let shared = UserRepository()
    var localService = LocalService()
    
    init(localService: LocalService = LocalService.shared) {
        self.localService = localService
    }
    
    func getCurrentUser() -> String? {
        self.localService.getCurrentUser()
    }
    
    func setCurrentUser(email: String) {
        self.localService.setCurrentUser(email: email)
    }
    
    func removeCurrentUser() {
        self.localService.removeCurrentUser()
    }
}
