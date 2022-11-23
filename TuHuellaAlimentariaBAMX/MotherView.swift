//
//  MotherView.swift
//  TuHuellaAlimentariaBAMX
//
//  Created by Carlos Garcia Mercado on 16/11/22.
//

import SwiftUI

struct MotherView: View {
    
    @StateObject var viewRouter: ViewRouter
    
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
            Question(viewRouter: viewRouter,q: "Pregunta1",ans1: "Respuesta1",
                     ans2: "Respuesta2",
                     ans3: "Respuesta3",
                     ans4: "Respuesta4", bg: creamColor, fg: redColor)
        case .question2:
            Question(viewRouter: viewRouter,q: "Pregunta2",ans1: "Respuesta1",
                     ans2: "Respuesta2",
                     ans3: "Respuesta3",
                     ans4: "Respuesta4", bg: creamColor, fg: redColor)
        case .question3:
            Question(viewRouter: viewRouter,q: "Pregunta3",ans1: "Respuesta1",
                     ans2: "Respuesta2",
                     ans3: "Respuesta3",
                     ans4: "Respuesta4", bg: creamColor, fg: redColor)
        case .question4:
            Question(viewRouter: viewRouter,q: "Pregunta4",ans1: "Respuesta1",
                     ans2: "Respuesta2",
                     ans3: "Respuesta3",
                     ans4: "Respuesta4", bg: creamColor, fg: redColor)
        case .question5:
            Question(viewRouter: viewRouter,q: "Pregunta5",ans1: "Respuesta1",
                     ans2: "Respuesta2",
                     ans3: "Respuesta3",
                     ans4: "Respuesta4", bg: creamColor, fg: redColor)
        case .question6:
            Question(viewRouter: viewRouter,q: "Pregunta6",ans1: "Respuesta1",
                     ans2: "Respuesta2",
                     ans3: "Respuesta3",
                     ans4: "Respuesta4", bg: creamColor, fg: redColor)
        case .question7:
            Question(viewRouter: viewRouter,q: "Pregunta7",ans1: "Respuesta1",
                     ans2: "Respuesta2",
                     ans3: "Respuesta3",
                     ans4: "Respuesta4", bg: creamColor, fg: redColor)
        case .question8:
            Question(viewRouter: viewRouter,q: "Pregunta8",ans1: "Respuesta1",
                     ans2: "Respuesta2",
                     ans3: "Respuesta3",
                     ans4: "Respuesta4", bg: creamColor, fg: redColor)
        case .question9:
            Question(viewRouter: viewRouter,q: "Pregunta9",ans1: "Respuesta1",
                     ans2: "Respuesta2",
                     ans3: "Respuesta3",
                     ans4: "Respuesta4", bg: creamColor, fg: redColor)
        case .question10:
            Question(viewRouter: viewRouter,q: "Pregunta10",ans1: "Respuesta1",
                     ans2: "Respuesta2",
                     ans3: "Respuesta3",
                     ans4: "Respuesta4", bg: creamColor, fg: redColor)
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
