//
//  ContentRequirement.swift
//  Exam
//
//  Created by Ramona NF on 23/11/23.
//

import Foundation

protocol DataRequirementProtocol {
    func getData() async -> MyModel?
}

class DataRequirement: DataRequirementProtocol {
    static let shared = DataRequirement() // Singleton
    let dataRepository: DataRepository // Uso de un singleton

    init(dataRepository: DataRepository = DataRepository.shared) {
        self.dataRepository = dataRepository
    }
    
    func getData() async -> MyModel? {
        return await dataRepository.getData()
    }
}
