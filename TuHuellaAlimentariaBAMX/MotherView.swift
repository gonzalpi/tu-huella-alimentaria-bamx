//
//  MotherView.swift
//  TuHuellaAlimentariaBAMX
//
//  Created by Carlos Garcia Mercado on 16/11/22.
//

import SwiftUI

struct MotherView: View {
    
    @StateObject var viewRouter: ViewRouter
    
    var defaultQuestion = QuestionType(
        ques: "Pregunta Default",
        answer: [
            AnswerType(ans:"Respuesta1",pnt:10),
            AnswerType(ans:"Respuesta2",pnt:20),
            AnswerType(ans:"Respuesta3",pnt:30),
            AnswerType(ans:"Respuesta4",pnt:40),
        ]
    )
    
    var body: some View {
        switch viewRouter.currentPage {
        case .splash:
            Splash(viewRouter: viewRouter, bg: redColor)
        case .login:
            Login(viewRouter: viewRouter, bg: creamColor, fg: redColor)
        case .welcome:
            Welcome(viewRouter: viewRouter, name: "Alejandro", bg: creamColor, fg: redColor)
        case .instructions:
            Instructions(viewRouter: viewRouter,bg: creamColor, fg: redColor)
        case .question1:
            Question(viewRouter: viewRouter,questionSt: defaultQuestion, bg: creamColor, fg: redColor)
        case .question2:
            Question(viewRouter: viewRouter,questionSt: defaultQuestion, bg: creamColor, fg: redColor)
        case .question3:
            Question(viewRouter: viewRouter,questionSt: defaultQuestion, bg: creamColor, fg: redColor)
        case .question4:
            Question(viewRouter: viewRouter,questionSt: defaultQuestion, bg: creamColor, fg: redColor)
        case .question5:
            Question(viewRouter: viewRouter,questionSt: defaultQuestion, bg: creamColor, fg: redColor)
        case .question6:
            Question(viewRouter: viewRouter,questionSt: defaultQuestion, bg: creamColor, fg: redColor)
        case .question7:
            Question(viewRouter: viewRouter,questionSt: defaultQuestion, bg: creamColor, fg: redColor)
        case .question8:
            Question(viewRouter: viewRouter,questionSt: defaultQuestion, bg: creamColor, fg: redColor)
        case .question9:
            Question(viewRouter: viewRouter,questionSt: defaultQuestion, bg: creamColor, fg: redColor)
        case .question10:
            Question(viewRouter: viewRouter,questionSt: defaultQuestion, bg: creamColor, fg: redColor)
        case .footprint:
            Footprint(viewRouter: viewRouter, footprint: "8000 kg", bg: redColor, fg: creamColor)
        case .donate:
            Donate(viewRouter: viewRouter, bg: creamColor, fg: redColor)

        }
    }
}

struct MotherView_Previews: PreviewProvider {
    static var previews: some View {
        MotherView(viewRouter: ViewRouter())
    }
}
