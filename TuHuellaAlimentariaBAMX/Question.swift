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
    
    let q: String
    let bg: Color,
        fg: Color
    init(viewRouter: ViewRouter, q: String, bg: Color, fg: Color) {
        _viewRouter =  StateObject(wrappedValue: viewRouter)
        self.q = q
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
                Text(q)
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
                            AnswerButton(bg: answerBlueColor)
                            AnswerButton(bg: answerYellowColor)
                        }
                        HStack {
                            AnswerButton(bg: answerGreenColor)
                            AnswerButton(bg: answerRedColor)
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
    let bg: Color
    init(bg: Color) {
        self.bg = bg
    }
    var body: some View {
        ZStack {
            HStack {
                Rectangle()
                    .fill(bg)
                    .frame(width: 170, height: 150)
                    .cornerRadius(20)
            }
            .frame(width: 180, height: 160)
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 133, height: 100)
        }
    }
}

struct Question_Previews: PreviewProvider {
    static var previews: some View {
        Question(
            viewRouter: ViewRouter(),
            q: "¿Cuántas veces vas al súper al mes?",
            bg: Color(#colorLiteral(red: 242/256, green: 230/256, blue: 211/256, alpha: 1)),
            fg: Color(#colorLiteral(red: 219/256, green: 62/256, blue: 76/256, alpha: 1))
        )
    }
}
