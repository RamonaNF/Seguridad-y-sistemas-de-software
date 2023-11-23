//
//  CourseRepository.swift
//  RRO
//
//  Created by Diego Perdomo Salcedo on 29/10/23.
//

import Foundation

/// Clase para obtener datos de cursos a través de la API.
class CourseRepository: CourseAPIProtocol {
    let netService: NetworkAPIService
    static let shared = CourseRepository()
    
    init(netService: NetworkAPIService = NetworkAPIService.shared) { // Singleton
        self.netService = netService // Inicializamos la instancia shared
    }
    
    /// Función para obtener una lista de curso.
    func getCourseList() async -> ServerResponse<[Course]>?{
        let params = [ // Parametros a agregar en el request
            "cost[gte]": 0
        ]
        
        return await netService.self.get(url: URL(string: "\(API.base)\(API.routes.course)")!, params: params)
    }
    
    /// Función para obtener la lista de cursos del usuario.
    func getMyCourses() async -> ServerResponse<[Course]>? {
        print("Solicitando info... 4")
        print("\(API.base)\(API.routes.myCourses)")
        return await netService.self.get(url: URL(string: "\(API.base)\(API.routes.myCourses)")!)
    }
    
    /// Función para obtener información de un curso en específico.
    ///
    /// - Parametros:
    ///   - id: El id del curso.
    ///
    /// - Return: La información del curso correspondiente con el id.
    func getCourse(id: String) async -> ServerResponse<[Course]>? {
        return await netService.self.get(url: URL(string: "\(API.base)\(API.routes.course)/\(id)")!)
    }
    
    func updateCourseRating(model: Rating) async -> ServerResponse<[Course]>? {
        let params:[String:Any] = [ // Parametros a agregar en el request
            "id": model.id,
            "rating": model.rating
        ]
        
        return await netService.self.put(url: URL(string: "\(API.base)\(API.routes.courseRating)")!, body: params/*model*/)
    }
}
