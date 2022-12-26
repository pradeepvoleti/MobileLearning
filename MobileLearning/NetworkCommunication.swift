//
//  NetworkCommunication.swift
//  MobileLearning
//
//  Created by Pradeep Voleti on 26/12/22.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case parsing
    case unknown
    case custom(Error)
}

enum RequestURL: String {
    case people = "https://gist.githubusercontent.com/russellbstephens/9e528b12fd1a45a7ff4e4691adcddf10/raw/5ec8ce76460e8f29c9b0f99f3bf3450b06696482/people.json"
}

struct NetworkCommunication {
    
    static func request(request: RequestURL, result: @escaping (Result<Data, NetworkError>) -> Void) {
        guard let url = URL(string: request.rawValue) else {
            result(.failure(.invalidURL))
            return
        }
        let urlRequest = URLRequest(url: url)
        let sesion = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            
            if let data {
                result(.success(data))
            } else if let error {
                result(.failure(.custom(error)))
            } else {
                result(.failure(.unknown))
            }
//            print(response)
        }
        sesion.resume()
    }
}

