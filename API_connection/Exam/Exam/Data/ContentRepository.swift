//
//  ContentRepository.swift
//  Exam
//
//  Created by Ramona NF on 23/11/23.
//

import Foundation

//  Protocolo del servicio de la API
protocol DataAPIProtocol { //  Mapear API (conexiones, URLs necesarias) -> BAAS (backend as a service)
    // POST: body de la petición HTTP (decodificado dentro del paquete)
    // GET: query como parámetro
    
    // async func: porque el método podría tomar mucho tiempo en devolver la información
    
    // EX URL https://api...?api_key=MYAPIKEY
    func getData() async -> MyModel? // ? Podría devolver null
}


// Rutas
struct Api {
    static let base = "" // URL base
    
    struct routes {
        static let miRuta = "" // Módulo de la API
    }
}


class DataRepository: DataAPIProtocol { // Se hereda del protocolo
    let nservice: NetworkAPIService // Uso del singleton
    static let shared = DataRepository()
    
    // Para que en cada acceso al repo por default se use el singleton de nuestra API
    init(nservice: NetworkAPIService = NetworkAPIService.shared) { // Asigna parámetro por default
        self.nservice = nservice
    }
    
    func getData() async -> MyModel? {
        return await nservice.getAPIinfo(url: URL(string:"\(Api.base)\(Api.routes.miRuta)")!)
    }
}
