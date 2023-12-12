//
//  Styles.swift
//  GuessWord
//
//  Created by robin tetley on 08/12/2023.
//

import SwiftUI
//we can use these anywhere in our app to make sure our UI looks nice and uniform
extension View {
    func titleStyle() -> some View {
        self
            .font(.system(size: 48))
        //so it's really shrunken horizontally
            .fontWidth(.condensed)
            .fontWeight(.black)
        //so it wraps across multiple lines.
            .multilineTextAlignment(.center)
    }
    
    func subtitleStyle() -> some View {
        self
            .font(.title.bold())
            .padding(.bottom, 40)
            .foregroundStyle(.secondary)
    }
    
    func backgroundGradient() -> some View {
        self
            .background(LinearGradient(colors: [ .yellow, .white], startPoint: .top, endPoint: .bottom))
    }
}


struct QuestionButton: ButtonStyle {
    //needs a background color
    var color: Color
    //needs the below in order to conform the BS
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.largeTitle.bold())
            .shadow(color: configuration.isPressed ? .clear : .black.opacity(0.75), radius: 3)
        //space around the text
            .padding()
        //use all the available width of the screen
            .frame(maxWidth: .infinity)
            .background(configuration.isPressed ? .white : color)
            .clipShape(.capsule)
            .foregroundStyle(configuration.isPressed ? .blue : .white)
        //this shadow is being applied after the frame and background. THe first shadow is applied to the text, this one to the main capsule shaped colour block around it.
            .shadow(radius: configuration.isPressed ? 0 : 10)
    }
}

extension ButtonStyle where Self == QuestionButton {
    static func question(color: Color) -> QuestionButton {
        QuestionButton(color: color)
    }
}

//used for the new game and play again buttons
struct PrimaryButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.title.bold())
            .foregroundStyle(configuration.isPressed ? .white : .blue)
            .padding(10)
            .padding(.horizontal, 10)
            .background(configuration.isPressed ? .blue : .white)
            .clipShape(.capsule)
    }
}

extension ButtonStyle where Self == PrimaryButton{
    static var primary: PrimaryButton {
        PrimaryButton()
    }
}
