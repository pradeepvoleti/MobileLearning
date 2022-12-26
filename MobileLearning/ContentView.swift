//
//  ContentView.swift
//  MobileLearning
//
//  Created by Pradeep Voleti on 20/12/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ListViewModel()

    var body: some View {
        List(0..<viewModel.names.count, id: \.self) { idx in
            VStack(alignment: .leading) {
                item(key: "Name", value: viewModel.names[idx])
                item(key: "Favorite Language", value: viewModel.languages[idx])
            }
        }
    }
    
    func item(key: String, value: String) -> some View {
        HStack {
            Text(key + ": ")
                .bold()
            Text(value)
        }
    }
}
