//
//  NetworkService.swift
//  MobileLearning
//
//  Created by Pradeep Voleti on 26/12/22.
//

import Foundation

protocol NetworkServiceProvidable {
    static func getPeopleList(completionHandler: @escaping (Result<PeopleList, NetworkError>) -> Void)
}

class NetworkService: NetworkServiceProvidable {
    
    static func getPeopleList(completionHandler: @escaping (Result<PeopleList, NetworkError>) -> Void) {
        NetworkCommunication.request(request: .people) { result in
            switch result {
            case .success(let success):
                
                guard let model = try? JSONDecoder().decode(PeopleList.self, from: success) else {
                    
                    completionHandler(.failure(.parsing))
                    return
                }
                completionHandler(.success(model))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
}
