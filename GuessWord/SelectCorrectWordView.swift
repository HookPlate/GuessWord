//
//  QuestionView.swift
//  GuessWord
//
//  Created by robin tetley on 01/12/2023.
//

import SwiftUI

struct SelectCorrectWordView: View {
    
    @Environment(ViewModel.self) var viewModel
    //our local source of truth is no not the below but the above
    //var question = SelectCorrectWordQuestion()
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("Question \(viewModel.questionNumber)")
                .fontDesign(.rounded)
                .fontWeight(.black)
            
            Text(viewModel.correctAnswer)
                .multilineTextAlignment(.center)
                .font(.largeTitle)
            
            Text(viewModel.questionText)
                .multilineTextAlignment(.center)
                .font(.largeTitle)
            //show our answer buttons
            ForEach(0..<viewModel.allAnswers.count, id: \.self) { i in
                Button {
                    //pick an answer
                    select(viewModel.allAnswers[i])
                } label: {
                    Text(viewModel.allAnswers[i])
                }
            }
            //leaves us with 1 third of space at the top since spacers subdivide the space between them
            Spacer()
            Spacer()
        }
        .padding(.horizontal)
    }
    
    func select(_ word: String) {
        withAnimation {
            viewModel.check(answer: word)
        }
    }
}

#Preview {
    SelectCorrectWordView()
        .environment(ViewModel())
}
