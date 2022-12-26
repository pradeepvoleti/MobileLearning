//
//  PeopleList.swift
//  MobileLearning
//
//  Created by Pradeep Voleti on 26/12/22.
//

import Foundation

struct PeopleList: Codable {
    let people: [Person]
}

struct Person: Codable {
    let name: String
    let language: String?
}
