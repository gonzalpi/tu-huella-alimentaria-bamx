//
//  Instructions.swift
//  TuHuellaAlimentariaBAMX
//
//  Created by rody on 30/10/22.
//

import SwiftUI

struct Instructions: View {
    let bg: Color,
        fg: Color
    init(bg: Color, fg: Color) {
        self.bg = bg
        self.fg = fg
    }
    var body: some View {
        VStack {
            Spacer()
            ZStack {
                Ellipse()
                    .fill(fg)
                    .frame(width: 500, height: 250)
                    .rotationEffect(Angle(degrees: 15), anchor: .center)
                    .padding(.top, -200)
                Rectangle()
                    .fill(fg)
                    .frame(width: 500, height: 400)
                    .padding(.top, -500)
                VStack {                    Image("logo")
                        .resizable()
                        .frame(width: 106, height: 133)
                    Text("Contesta las\nsiguientes\npreguntas\nhonestamente")
                        .foregroundColor(.white)
                        .font(.system(size: 35, weight: .semibold, design: .default))
                        .multilineTextAlignment(.center)
                    Spacer(minLength: 150)
                    Button(action: {}, label: {
                        ZStack {
                            Circle()
                                .fill(fg)
                                .frame(width: 109, height: 109)
                            Image("fwd")
                                .resizable()
                                .frame(width: 90, height: 90)
                                .padding(.leading, 10)
                                .aspectRatio(contentMode: .fit)
                        }
                    })
                    Spacer()
                    FooterButton()
                        .padding(.bottom, -80)
                }
            }
        }
        .background(bg)
    }
}

struct Instructions_Previews: PreviewProvider {
    static var previews: some View {
        Instructions(
            bg: Color(#colorLiteral(red: 242/256, green: 230/256, blue: 211/256, alpha: 1)),
            fg: Color(#colorLiteral(red: 219/256, green: 62/256, blue: 76/256, alpha: 1))
        )
    }
}
