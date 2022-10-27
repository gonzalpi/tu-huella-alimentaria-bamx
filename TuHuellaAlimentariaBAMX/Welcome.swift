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
    init (bg: Color, fg: Color) {
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
                .background(redBgColor)
                .frame(width: .infinity, height: 86)
                .cornerRadius(43)
                .padding(.leading, -50)
                Spacer()
                Text("Conozcamos tu\nhuella alimentaria")
                    .font(.system(size: 40, weight: .regular))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                Button(action: {}, label: {
                    ZStack {
                        Rectangle()
                            .fill(redBgColor)
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
        .background(creamBgColor)
    }
}

struct FooterButton: View {
    var body: some View {
        ZStack {
            Image("fruits")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.size.width, height: 180)
                .cornerRadius(43)
                .opacity(0.3)
            Text("¡Terminemos el\nhambre!\n\n")
                .font(.system(size: 32, weight: .regular))
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
        }
    }
}
