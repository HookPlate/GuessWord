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
    
    //whenever any question us shown shuffle the below array
    let colors: [Color] = [.purple, .blue, .green, .pink, .orange].shuffled()
    
    let timer = Timer.publish(every: 1 / 30, on: .main, in: .common).autoconnect()
    
    @State private var timeUsed = 0.0
    
    var timeRemaining: Double {
        //capping it so 0 it the absolute lowest we go.
        max(0, viewModel.timeAllowed - timeUsed)
    }
    
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
                //would be more long winded without the extension in the styles file 
                .buttonStyle(.question(color: colors[i]))
            }
            //leaves us with 1 third of space at the top since spacers subdivide the space between them
            Spacer()
            Spacer()
            
            ZStack {
                Capsule()
                    .fill(.yellow.gradient)
                    .frame(height: 50)
                    .containerRelativeFrame(.horizontal) { value, axis in
                        value * timeRemaining / viewModel.timeAllowed
                    }
                
                Text("Time: " + timeRemaining.formatted(.number.precision(.fractionLength(2))))
                    .font(.largeTitle)
                    .foregroundStyle(timeRemaining >= 3 ? .black : .red)
                //ensures 1 takes up the same space as 8
                    .monospacedDigit()
            }
        }
        .padding(.horizontal)
        //tell me when the timer fires
        .onReceive(timer) { time in
            timeUsed += 1 / 30
            
            if timeUsed >= viewModel.timeAllowed {
                //game over
            }
        }
        .transition(.push(from: .trailing))
    }
    
    func select(_ word: String) {
        //end the timer now
        timer.upstream.connect().cancel()
        
        withAnimation {
            viewModel.check(answer: word)
        }
    }
}

#Preview {
    SelectCorrectWordView()
        .environment(ViewModel())
}
