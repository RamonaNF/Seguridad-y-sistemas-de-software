//
//  NetworkAPIService.swift
//  Pokedex
//
//  PASO 3: Singleton del API (configurar la librería)
//  Patrón de diseño para tener una sola instancia de un objeto
//
//  Created by Ramona NF on 09/10/23.
//

import Foundation
import Alamofire // AF

class NetworkAPIService {
    // Singleton: Proporciona un único acceso a la instancia de un objeto
    static let shared = NetworkAPIService()

    // PASO 4: Obtener respuesta de la API
    func getPokedex(url: URL, limit: Int) async -> Pokedex? {
        let parameters: Parameters = [
            "limit": limit
        ]
        
        /*
        // Request status code
        let taskRequest = AF.request(url, method: .get, parameters: parameters).validate()
        
        // Transformamos los datos de forma asíncrona a DataResponse<Data,AFError>
        let response = await taskRequest.serializingData().response
        // Data: Permite que los buffers de bytes adopten el comportamiento de objetos Foundation
        // AFError: enum con valores de success y failure
        
        switch response.result {
            case .success(let data):
                do {
                    return try JSONDecoder().decode(Pokedex.self, from: data) // .self para el tipo
                } catch {
                    return nil
                }
            
            case let .failure(error):
                debugPrint(error.localizedDescription)
                return nil
        }
        */
        
        do {
            return try await withCheckedThrowingContinuation {
                continuation in AF.request(url, method: .get, parameters: parameters)
                    .responseDecodable(of: Pokedex.self) {
                        response in switch response.result {
                            case .success(let data):
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
    
    func getPokemon(url: URL) async -> Perfil? {
        do {
            return try await withCheckedThrowingContinuation {
                continuation in AF.request(url, method: .get)
                    .responseDecodable(of: Perfil.self) {
                        response in switch response.result {
                            case .success(let data):
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
