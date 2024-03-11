//
//  NetworkManager.swift
//  AzApi
//
//  Created by Sefa Aycicek on 27.02.2024.
//

import UIKit

class NetworkManager {

    static let shared = NetworkManager()
    
    // http method
    // application/json
    // header 401
    // error & response
    
    //NSData & Data -> binary array
    func fetchData<T : Decodable>(from urlString : String, method : HTTPMethod, body : Data?, completion: @escaping (Result<T, NetworkError>)->Void) {
        
        guard let url = URL(string: urlString) else {
            completion(.failure(.invalidURL))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.httpBody = body
         
        var httpFields = request.allHTTPHeaderFields ?? [:]
       // httpFields["Authorization"] = "Bearer <Token>"
        request.allHTTPHeaderFields = httpFields
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let error = error {
                completion(.failure(.unknown(error)))
                return
            }
            
            guard let httpResponse =  response as? HTTPURLResponse else {
                let error = NSError(domain: "Invalid response", code: -1)
                completion(.failure(.unknown(error)))
                return
            }
            
            if !(200...299).contains(httpResponse.statusCode) {
                completion(.failure(.httpResponseError(statusCode: httpResponse.statusCode)))
                return
            }
            
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            
            print("herşeyden tamam")
            
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                completion(Result.success(decodedData))
            } catch {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
}
