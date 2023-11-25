//
//  NetworkAPIService.swift
//  Exam
//
//  Created by Ramona NF on 23/11/23.
//

import Foundation
import Alamofire // AF

class NetworkAPIService {
    // Singleton: Proporciona un único acceso a la instancia de un objeto
    static let shared = NetworkAPIService() // En este caso, el API service

    // Obtener respuesta de la API
    func getAPIinfo(url: URL) async -> MyModel? {
        let parameters: Parameters = [
            "api_key": ""
        ]
        
        //print("REQUEST URL ", url)
        
        do {
            // Petición y manejo de error/éxito en la respuesta
            return try await withCheckedThrowingContinuation {
                continuation in AF.request(url, method: .get, parameters: parameters)
                    .responseDecodable(of: MyModel.self) {
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
