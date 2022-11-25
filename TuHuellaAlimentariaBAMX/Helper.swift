//
//  Helper.swift
//  TuHuellaAlimentariaBAMX
//
//  Created by Carlos Garcia Mercado on 16/11/22.
//

import Foundation

enum Page {
    case splash
    case login
    case welcome
    case instructions
    case question0
    case question1
    case question2
    case question3
    case question4
    case question5
    case question6
    case question7
    case question8
    case question9
    case footprint
    case donate
}

struct QuestionType: Identifiable, Codable {
    let id: String
    let question: String
    let answers: [String]
    let scores: [Int]
}
