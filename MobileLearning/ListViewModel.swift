//
//  ListViewModel.swift
//  MobileLearning
//
//  Created by Pradeep Voleti on 26/12/22.
//

import Foundation

class ListViewModel: ObservableObject {
    
    @Published var names: [String] = []
    @Published var languages: [String] = []

    private let service: NetworkServiceProvidable.Type
    
    init(service: NetworkServiceProvidable.Type = NetworkService.self) {
        self.service = service
        getPeopleList()
    }
    
    func getPeopleList() {
        service.getPeopleList { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let model):
                
                DispatchQueue.main.async {
                    self.names = model.people.map { $0.name }
                    self.languages = model.people.map { $0.language ?? "None" }
                }
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
}
