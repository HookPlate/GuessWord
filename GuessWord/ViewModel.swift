//
//  ViewModel.swift
//  GuessWord
//
//  Created by robin tetley on 08/12/2023.
//

import Foundation

@Observable
@dynamicMemberLookup
class ViewModel {
    var questionNumber = 0
    var question : SelectCorrectWordQuestion!
    var timeAllowed = 10.0
    
    
    subscript<Value>(dynamicMember keyPath: KeyPath<SelectCorrectWordQuestion , Value>) -> Value {
            question[keyPath: keyPath]
    }
    
    init() {
        nextQuestion()
    }
    
    func nextQuestion() {
        question = SelectCorrectWordQuestion()
        questionNumber += 1
    }
    
    func check(answer: String) {
        if answer == question.correctAnswer {
            nextQuestion()
        } else {
            //gameover
        }
    }

    func end() {
        //we will end the game.
    }
}
