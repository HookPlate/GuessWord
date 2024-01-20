//
//  QuestionView.swift
//  GuessWord
//
//  Created by robin tetley on 01/12/2023.
//

import SwiftUI
import AVFoundation

struct SelectCorrectWordView: View {
    
    @State var audioPlayer: AVAudioPlayer!
    
    //@Environment(ViewModel.self) var viewModel
    @EnvironmentObject var viewModel: ViewModel
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
                .font(.system(size: 30))
                //.fontDesign(.rounded)
                .fontWeight(.bold)
           
            
//            Text(viewModel.correctAnswer)
//                .multilineTextAlignment(.center)
//                .font(.largeTitle)
            Button {
                playSounds(viewModel.question.correctAnswer)
            } label: {
                Image(viewModel.question.animal)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
            }
            
            
            Text(viewModel.question.questionText)
                .multilineTextAlignment(.center)
               // .padding()
                //.fontWeight(.black)
                //.font(.title)
            Spacer()
            //show our answer buttons
            ForEach(0..<viewModel.question.allAnswers.count, id: \.self) { i in
                Button {
                    //pick an answer
                    select(viewModel.question.allAnswers[i])
                } label: {
                    Text(viewModel.question.allAnswers[i])
                }
                //would be more long winded without the extension in the styles file 
                .buttonStyle(.question(color: colors[i]))
            }
            //leaves us with 1 third of space at the top since spacers subdivide the space between them
            Spacer()
           // Spacer()
            
          //  ZStack {
//                Capsule()
//                    .fill(.yellow.gradient)
//                    .frame(height: 30)
//                    .containerRelativeFrame(.horizontal) { value, axis in
//                        value * timeRemaining / viewModel.timeAllowed
//                    }
                
                Text("Time: " + timeRemaining.formatted(.number.precision(.fractionLength(2))))
                    .font(.title)
                    .foregroundStyle(timeRemaining >= 3 ? .black : .red)
                //ensures 1 takes up the same space as 8
                    .monospacedDigit()
         //   }
            Spacer()
        }
        .padding(.horizontal)
        //tell me when the timer fires
        .onReceive(timer) { time in
            timeUsed += 1 / 30
            
            if timeUsed >= viewModel.timeAllowed {
                viewModel.gameOver()
            }
        }
        .animation(.easeInOut)
    }
    
    func select(_ word: String) {
        //end the timer now
        timer.upstream.connect().cancel()
        
        withAnimation {
            viewModel.check(answer: word)
        }
    }
    
    func playSounds(_ soundFileName : String) {
        guard let soundURL = Bundle.main.url(forResource: soundFileName, withExtension: "mp3") else {
                fatalError("Unable to find \(soundFileName) in bundle")
            }

            do {
                audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
            } catch {
                print(error.localizedDescription)
            }
            audioPlayer.play()
        }
}

//#Preview {
//    SelectCorrectWordView()
//        .environment(ViewModel())
//}
