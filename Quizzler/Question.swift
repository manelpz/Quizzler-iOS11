//
//  Question.swift
//  Quizzler
//
//  Created by Emmanuel Lopez Guerrero on 18/09/25.
//  Copyright © 2025 London App Brewery. All rights reserved.
//

import Foundation

class Question{
    let text : String
    let correctAnswer : Bool
    
    init(text: String, correctAnswer: Bool) {
        self.text = text
        self.correctAnswer = correctAnswer
    }
    
}

