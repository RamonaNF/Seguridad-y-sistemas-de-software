//
//  NetworkAPIService.swift
//  Practica
//
//  Created by Ramona NF on 22/11/23.
//

import Foundation
import Alamofire // AF

class NetworkAPIService {
    // Singleton: Proporciona un único acceso a la instancia de un objeto
    static let shared = NetworkAPIService()

    // Obtener respuesta de la API
    func getAPIinfo(url: URL) async -> MovieResponse? {
        let parameters: Parameters = [
            "api_key": "fd5d2f8e266825589139f3a8eade1375"
        ]
        
        //print("REQUEST URL ", url)
        
        do {
            // Petición y manejo de error o éxito en la respuesta
            return try await withCheckedThrowingContinuation {
                continuation in AF.request(url, method: .get, parameters: parameters)
                    .responseDecodable(of: MovieResponse.self) {
                        response in switch response.result {
                            case .success(let data):
                                //print("SUCCESS", data)
                                continuation.resume(returning: data)
                                
                            case .failure(let error):
                                debugPrint(error.localizedDescription)
                                continuation.resume(throwing: NSError())
                        }
                    }
            }
        } catch {
            debugPrint("Error NetworkAPIService")
        }
        
        return nil
    }
}
