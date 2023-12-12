//
//  MenuView.swift
//  GuessWord
//
//  Created by robin tetley on 12/12/2023.
//

import SwiftUI

struct MenuView: View {
    @AppStorage("LastScore") private var lastScore = 0
    @Environment(ViewModel.self) var viewModel
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("FLASH MATH")
                .titleStyle()
            Text("Last Score: \(lastScore)")
                .subtitleStyle()
            Button("New Game", action: viewModel.start)
                .buttonStyle(.primary)
            
            Spacer()
            Spacer()
        
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .backgroundGradient()
    }
}

#Preview {
    MenuView()
        .environment(ViewModel())
}

