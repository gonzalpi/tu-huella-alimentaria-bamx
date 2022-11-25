//
//  Question.swift
//  TuHuellaAlimentariaBAMX
//
//  Created by rody on 30/10/22.
//

import SwiftUI

let answerBlueColor = Color(#colorLiteral(red: 111/256, green: 202/256, blue: 215/256, alpha: 1))
let answerYellowColor = Color(#colorLiteral(red: 238/256, green: 206/256, blue: 123/256, alpha: 1))
let answerGreenColor = Color(#colorLiteral(red: 138/256, green: 192/256, blue: 119/256, alpha: 1))
let answerRedColor = Color(#colorLiteral(red: 207/256, green: 104/256, blue: 104/256, alpha: 1))

struct Question: View {
    
    @StateObject var viewRouter: ViewRouter
    @EnvironmentObject var questionViewModel: QuestionsViewModel
    
    let question: QuestionType
    let bg: Color,
        fg: Color
    
    init(viewRouter: ViewRouter, question: QuestionType, bg: Color, fg: Color) {
        _viewRouter =  StateObject(wrappedValue: viewRouter)
        self.question = question
        self.bg = bg
        self.fg = fg
    }
    
    var body: some View {
        ZStack {
            VStack {
                Circle()
                    .fill(fg)
                    .padding(.top, -600)
                    .frame(width: 625, height: 625)
                Spacer()
            }
            VStack {
                Text(question.question)
                    .frame(width: UIScreen.main.bounds.width - 50)
                    .foregroundColor(.white)
                    .font(.system(size: 40, weight: .semibold, design: .default))
                    .multilineTextAlignment(.center)
                    .padding(.top, 100)
                Spacer()
                ZStack {
                    Rectangle()
                        .fill(.white)
                        .frame(width: UIScreen.main.bounds.width, height: 420)
                        .cornerRadius(30)
                    VStack {
                        HStack {
                            AnswerButton(viewRouter: viewRouter,bg: answerBlueColor, answer: question.answers[0], score: question.scores[0])
                            AnswerButton(viewRouter: viewRouter,bg: answerYellowColor,answer:  question.answers[1], score: question.scores[1])
                        }
                        HStack {
                            AnswerButton(viewRouter: viewRouter,bg: answerGreenColor, answer:  question.answers[2], score: question.scores[2])
                            AnswerButton(viewRouter: viewRouter, bg: answerRedColor, answer:  question.answers[3], score: question.scores[3])
                        }
                        .padding(.bottom, 50)
                    }
                }
                .padding(.bottom, -60)
            }
        }
        .background(bg)
    }}

struct AnswerButton: View {
    @StateObject var viewRouter: ViewRouter
    let bg: Color
    let answer: String
    let score: Int
    let currentPageOnArray : Int
    
    let questions: [Page] = [.question0, .question1, .question2, .question3, .question4, .question5, .question6, .question7, .question8, .question9, .footprint]
    
    init(viewRouter: ViewRouter, bg: Color, answer: String, score: Int) {
        _viewRouter =  StateObject(wrappedValue: viewRouter)
        self.bg = bg
        self.answer = answer
        self.score = score
        self.currentPageOnArray = questions.firstIndex(where: { $0 == viewRouter.currentPage })!
    }
    var body: some View {
        Button(action: {
            viewRouter.points = viewRouter.points + score;
            viewRouter.currentPage = questions[currentPageOnArray + 1]
        },label: {
            ZStack {
                HStack {
                    Rectangle()
                        .fill(bg)
                        .frame(width: 170, height: 150)
                        .cornerRadius(20)
                }
                .frame(width: 180, height: 160)
                Text(answer)
                    .foregroundColor(.white)
                    .font(.system(size: 20, weight: .semibold, design: .default))
                    .multilineTextAlignment(.center)
            }
        })
    }
}

struct Question_Previews: PreviewProvider {
    static var previews: some View {
        let defaultQuestion = QuestionType(
            id: "0",
            question: "Pregunta",
            answers: ["10 puntos", "20 puntos", "30 puntos", "40 puntos"],
            scores: [10, 20, 30, 40]
        )
        Question(
            viewRouter: ViewRouter(),
            question: defaultQuestion,
            bg: Color(#colorLiteral(red: 242/256, green: 230/256, blue: 211/256, alpha: 1)),
            fg: Color(#colorLiteral(red: 219/256, green: 62/256, blue: 76/256, alpha: 1))
        )
    }
}
