//
//  IdentifyWordQuestion.swift
//  GuessWord
//
//  Created by robin tetley on 01/12/2023.
//

import Foundation

struct SelectCorrectWordQuestion {
    var questionText: String
    var correctAnswer: String
    var allAnswers: [String]
    var allWords = ["door", "floor", "poor", "because", "find", "kind", "mind", "behind", "child", "children", "wild", "climb", "most", "only", "both", "old", "cold"]
    
    init() {
        var numbers = (0...16).shuffled()
        var correctAnswerIndex = numbers.removeFirst()
        correctAnswer = allWords[correctAnswerIndex]
        allAnswers = Array(allWords.prefix(4))
        allAnswers.append(correctAnswer)
        allAnswers.shuffle()
        questionText = "Listen to the word then select it from below."
    }
}
