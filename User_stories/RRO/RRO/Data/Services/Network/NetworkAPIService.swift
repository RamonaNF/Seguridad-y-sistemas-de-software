//
//  DummyAPIService.swift
//  RRO
//
//  Created by Ramona NF on 20/10/23.
//

import Foundation
import Alamofire

/// Singleton that manages the network requests for a REST api
class NetworkAPIService {
    static let shared = NetworkAPIService()
    private let _decoder = JSONDecoder()
    private let _encoder = JSONEncoder()
    private var _headers: HTTPHeaders
    private let _session: Session
    
    /// The constructor sets the date formater to allow dates with fractional seconds
    init() {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-DD'T'HH:mm:ss.SSS'Z'"
        _decoder.dateDecodingStrategy = .formatted(formatter)
        _encoder.dateEncodingStrategy = .iso8601
        _headers = HTTPHeaders(dictionaryLiteral: ("user-platform", "ios"))
        _session = Session(interceptor: RequestInterceptor())
        
    }
    
    /// Get request on a specified url and serialize the response into a given codable struct
    /// - Parameter url: Url where the request will be sent to
    /// - Parameter params: Dictionary for the url parameters (optional)
    /// - Returns: The serialized payload or nil if it fails
    func get<T: Codable>(url: URL, params: Parameters = [:]) async -> T? {
        print("Solicitando info... 5")
        do {
            return try await withCheckedThrowingContinuation {
                continuation in _session.request(url, method: .get, parameters: params, headers: _headers)
                    .responseDecodable(of: T.self, decoder: self._decoder) {
                        response in switch response.result {
                        case .success(let data):
                            // Print the response data
                            // debugPrint("Response Data: \(data)")
                            continuation.resume(returning: data)
                        case .failure(let error):
                            // Print the error
                            // debugPrint("Request Error: \(error)")
                            continuation.resume(throwing: error)
                        }
                    }
            }
        } catch {
            debugPrint("NetworkAPIService Error: \(error)")
        }
        
        return nil
    }

    
    /// Post request on a specified url and serialize the response into a given codable struct
    /// - Parameter url: Url where the request will be sent to
    /// - Parameter body: Dictionary with the data that will be sent in the body
    /// - Returns: The serialized payload or nil if it fails
    func post<T: Codable>(url: URL, body: String) async -> T? {
        do {
            let encodedBody = try _encoder.encode(body)
            let json = try JSONSerialization.jsonObject(with: encodedBody, options: []) as? Parameters
            
            return try await withCheckedThrowingContinuation {
                continuation in _session.request(url, method: .post, parameters: json, encoding: JSONEncoding.default, headers: _headers)
                    .responseDecodable(of: T.self, decoder: self._decoder) {
                        response in switch response.result {
                        case .success(let data):
                            print(response.result)
                            continuation.resume(returning: data)
                        case .failure(_):
                            print(response.result)
                            continuation.resume(throwing: NSError())
                        }
                    }
            }
            
        } catch {
            debugPrint("NetworkAPIService Error")
        }
        
        return nil
    }
    
    /// Post request on a specified url and serialize the response into a given codable struct
    /// - Parameter url: Url where the request will be sent to
    /// - Parameter body: Dictionary with the data that will be sent in the body
    /// - Returns: The serialized payload or nil if it fails
    func put<T: Codable>(url: URL, body: Parameters = [:]) async -> T? {
        do {
            return try await withCheckedThrowingContinuation {
                continuation in _session.request(url, method: .put, parameters: body, encoding: JSONEncoding.default, headers: _headers)
                    .responseDecodable(of: T.self, decoder: self._decoder) {
                        response in switch response.result {
                        case .success(let data):
                            print(response.result)
                            continuation.resume(returning: data)
                        case .failure(_):
                            print(response.result)
                            continuation.resume(throwing: NSError())
                        }
                    }
            }
            
        } catch {
            debugPrint("NetworkAPIService Error")
        }
        
        return nil
    }
}

