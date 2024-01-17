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
    var animal: String
//    var allWords = ["door", "floor", "poor", "because", "find", "kind", "mind", "behind", "child", "children", "wild", "climb", "most", "only", "both", "old", "cold"]
    var allWords = ["He", "in", "was", "time", "They", "and", "him", "saw", "One", "day", "when", "I'm", "big", "here", "now", "came", "by"]
    var animals = ["bear", "buffalo", "chick", "chicken", "cow", "crocodile", "dog", "duck", "elephant"]
    
    init() {
        var numbers = (0...16).shuffled()
        var correctAnswerIndex = numbers.removeFirst()
        correctAnswer = allWords[correctAnswerIndex]
        allAnswers = Array(allWords.prefix(4))
        allAnswers.append(correctAnswer)
        animal = animals.randomElement() ?? "bear"
        allAnswers.shuffle()
        questionText = "Tap the animal then the word below"
    }
}
