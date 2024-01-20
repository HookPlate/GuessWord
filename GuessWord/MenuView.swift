//
//  MenuView.swift
//  GuessWord
//
//  Created by robin tetley on 12/12/2023.
//

import SwiftUI

struct MenuView: View {
    @AppStorage("LastScore") private var lastScore = 0
    //@Environment(ViewModel.self) var viewModel
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        VStack {
            Spacer()
            
            Image(.logo)
                .clipShape(.rect(cornerRadius: 20))
                .padding(.bottom)
//                .phaseAnimator([false, true]) { content, phase in
//                    content
//                        .shadow(color: .white, radius: phase ? 20 : 40)
//                } animation: { _ in
//                        .easeInOut(duration: 1)
//                }
            
            Text("Amagama Word Race")
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

//#Preview {
//    MenuView()
//        .environment(ViewModel())
//}

