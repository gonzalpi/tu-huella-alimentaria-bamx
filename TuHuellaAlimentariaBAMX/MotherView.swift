//
//  MotherView.swift
//  TuHuellaAlimentariaBAMX
//
//  Created by Carlos Garcia Mercado on 16/11/22.
//

import SwiftUI
import GoogleSignIn

struct MotherView: View {
    
    @StateObject var viewRouter: ViewRouter
    @EnvironmentObject var questionViewModel: QuestionsViewModel
    private let user = GIDSignIn.sharedInstance.currentUser
    
    var defaultQuestion = QuestionType(
        id: "0",
        question: "Presiona cualquier botón para continuar",
        answers: ["", "", "", ""],
        scores: [0, 0, 0, 0]
    )
    
    var body: some View {
        switch viewRouter.currentPage {
        case .splash:
            Splash(viewRouter: viewRouter, bg: redColor)
        case .login:
            Login(viewRouter: viewRouter, bg: creamColor, fg: redColor)
        case .welcome:
            Welcome(viewRouter: viewRouter, name: user?.profile?.name ?? "", bg: creamColor, fg: redColor)
        case .instructions:
            Instructions(viewRouter: viewRouter,bg: creamColor, fg: redColor)
        case .question0:
            Question(viewRouter: viewRouter, question: questionViewModel.questions.count > 0 ? questionViewModel.questions[0] : defaultQuestion, bg: creamColor, fg: redColor)
        case .question1:
            Question(viewRouter: viewRouter, question: questionViewModel.questions.count > 1 ? questionViewModel.questions[1] : defaultQuestion, bg: creamColor, fg: redColor)
        case .question2:
            Question(viewRouter: viewRouter, question: questionViewModel.questions.count > 2 ? questionViewModel.questions[2] : defaultQuestion, bg: creamColor, fg: redColor)
        case .question3:
            Question(viewRouter: viewRouter, question: questionViewModel.questions.count > 3 ? questionViewModel.questions[3] : defaultQuestion, bg: creamColor, fg: redColor)
        case .question4:
            Question(viewRouter: viewRouter, question: questionViewModel.questions.count > 4 ? questionViewModel.questions[4] : defaultQuestion, bg: creamColor, fg: redColor)
        case .question5:
            Question(viewRouter: viewRouter, question: questionViewModel.questions.count > 5 ? questionViewModel.questions[5] : defaultQuestion, bg: creamColor, fg: redColor)
        case .question6:
            Question(viewRouter: viewRouter, question: questionViewModel.questions.count > 6 ? questionViewModel.questions[6] : defaultQuestion, bg: creamColor, fg: redColor)
        case .question7:
            Question(viewRouter: viewRouter, question: questionViewModel.questions.count > 7 ? questionViewModel.questions[7] : defaultQuestion, bg: creamColor, fg: redColor)
        case .question8:
            Question(viewRouter: viewRouter, question: questionViewModel.questions.count > 8 ? questionViewModel.questions[8] : defaultQuestion, bg: creamColor, fg: redColor)
        case .question9:
            Question(viewRouter: viewRouter, question: questionViewModel.questions.count > 9 ? questionViewModel.questions[9] : defaultQuestion, bg: creamColor, fg: redColor)
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
