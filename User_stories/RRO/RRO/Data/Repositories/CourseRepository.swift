//
//  CourseRepository.swift
//  RRO
//
//  Created by Diego Perdomo Salcedo on 29/10/23.
//

import Foundation

class CourseRepository: CourseAPIProtocol {
    
    let netService: NetworkAPIService
    static let shared = CourseRepository()
    
    init(netService: NetworkAPIService = NetworkAPIService.shared) {
        self.netService = netService
    }
    
    func getCourseList(cost: Int) async -> ServerResponse<[Course]>? {
        let params = [
            "cost[gte]": cost
        ]
        
        return await netService.self.get(url: URL(string: "\(API.base)\(API.routes.course)")!, params: params)
        
    }
    
    func getCourse(id: String) async -> ServerResponse<[Course]>? {
        return await netService.self.get(url: URL(string: "\(API.base)\(API.routes.course)/\(id)")!)
        
    }
}
