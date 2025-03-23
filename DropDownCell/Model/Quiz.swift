//
//  Quiz.swift
//  DropDownCell
//
//  Created by Saadet Şimşek on 23/03/2025.
//

import Foundation

struct QuizAnswer : Identifiable {
    var id: String = UUID().uuidString
    var answer: String
}

struct Quiz : Identifiable {
    let id: String = UUID().uuidString
    let questionText: String
    var answers: [QuizAnswer]
    
    static func mockData() -> [Quiz] {
        [
        Quiz(questionText: "dnjnednerhferjnrrfruen",
             answers: [
                QuizAnswer(answer: "one"),
                QuizAnswer(answer: "two"),
                QuizAnswer(answer: "three")
             ]),
        Quiz(questionText: "dhhsbhfbsdhfbdhdfhfdh",
             answers: [
                QuizAnswer(answer: "one"),
                QuizAnswer(answer: "two"),
                QuizAnswer(answer: "three"),
             ]),
        Quiz(questionText: "kedjeerfrıejfırej",
             answers: [
                QuizAnswer(answer: "one"),
                QuizAnswer(answer: "two"),
                
             ])
        ]
    }
}
