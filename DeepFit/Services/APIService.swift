//
//  APIService.swift
//  DeepFit
//
//  Created by Erdal Burak Cinar on 17.07.2023.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

struct HTTPRequest {
    let url: URL
    let method: HTTPMethod
    let headers: [String: String]?
    let body: Data?
}

enum HTTPError: Error {
    case requestFailed
    case invalidResponse
    case invalidData
}

class HTTPService {
    private let session: URLSession
    
    init() {
        self.session = URLSession.shared
    }
    
    func sendRequest(_ request: HTTPRequest, completion: @escaping (Result<Data, HTTPError>) -> Void) {
        var urlRequest = URLRequest(url: request.url)
        urlRequest.httpMethod = request.method.rawValue
        urlRequest.allHTTPHeaderFields = request.headers
        urlRequest.httpBody = request.body
        
        let task = session.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Error: \(error)")
                completion(.failure(.requestFailed))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let responseData = data else {
                completion(.failure(.invalidData))
                return
            }
            
            completion(.success(responseData))
        }
        
        task.resume()
    }
}
