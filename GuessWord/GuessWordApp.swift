//
//  GuessWordApp.swift
//  GuessWord
//
//  Created by robin tetley on 29/11/2023.
//First Commit at minimum mvp

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
