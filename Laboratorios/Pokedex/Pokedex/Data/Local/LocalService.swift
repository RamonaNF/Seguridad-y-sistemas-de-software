//
//  LocalService.swift
//  Pokedex
//
//  Created by Ramona NF on 18/10/23.
//

import Foundation

class LocalService { // UserDefaults: clase que interactúa con el sistema default de iOS
    static let shared = LocalService()
    
    func getCurrentUser() -> String? {
        return UserDefaults.standard.string(forKey: "currentUser")
    }
    
    func setCurrentUser(email: String) {
        return UserDefaults.standard.set(email, forKey: "currentUser")
    }
    
    func removeCurrentUser() {
        return UserDefaults.standard.removeObject(forKey: "currentUser")
    }
}
