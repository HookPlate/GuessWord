//
//  GuessWordApp.swift
//  GuessWord
//
//  Created by robin tetley on 29/11/2023.
//

import SwiftUI

@main
struct GuessWordApp: App {
    
    @State private var viewModel = ViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(viewModel)
        }
    }
}
