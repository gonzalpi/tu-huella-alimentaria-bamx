//
//  Welcome.swift
//  TuHuellaAlimentariaBAMX
//
//  Created by rody on 26/10/22.
//

import SwiftUI

struct Welcome: View {
    let hello: String
    let bg: Color,
        fg: Color
    init(bg: Color, fg: Color) {
        self.hello = "¡Hola!"
        self.bg = bg
        self.fg = fg
    }
    init(name: String, bg: Color, fg: Color) {
        self.hello = "¡Hola, " + name + "!"
        self.bg = bg
        self.fg = fg
    }

    var body: some View {
        HStack {
            Spacer()
            VStack {
                Spacer()
                VStack {
                    HStack {
                        Spacer(minLength: 55)
                        Image("logo")
                            .resizable()
                            .frame(width: 46, height: 54)
                        Text(hello)
                            .font(.system(size: 40, weight: .semibold))
                            .foregroundColor(.white)
                        Spacer(minLength: 15)
                    }
                    .padding(.top)
                    .padding(.bottom)
                }
                .background(fg)
                .frame(width: .infinity, height: 86)
                .cornerRadius(43)
                .padding(.leading, -50)
                Spacer()
                Text("Conozcamos tu huella alimentaria")
                    .font(.system(size: 40, weight: .regular))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width - 50)
                Button(action: {}, label: {
                    ZStack {
                        Rectangle()
                            .fill(fg)
                            .frame(width: 191, height: 62)
                            .cornerRadius(43)
                        Text("Empecemos")
                            .font(.system(size: 20, weight: .regular))
                            .foregroundColor(.white)
                    }
                })
                Spacer()
                Button(action: {}) {
                    FooterButton()
                        .padding(.bottom, -80)
                }
            }
            Spacer()
        }
        .background(bg)
    }
}

struct Welcome_Previews: PreviewProvider {
    static var previews: some View {
        Welcome(
            name: "Alejandro",
            bg: Color(#colorLiteral(red: 242/256, green: 230/256, blue: 211/256, alpha: 1)),
            fg: Color(#colorLiteral(red: 219/256, green: 62/256, blue: 76/256, alpha: 1))
        )
    }
}
