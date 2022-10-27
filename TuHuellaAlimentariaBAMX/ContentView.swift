//
//  ContentView.swift
//  TuHuellaAlimentariaBAMX
//
//  Created by álex on 22.10.22.
//

import SwiftUI

let redBgColor = Color(#colorLiteral(red: 219/256, green: 62/256, blue: 76/256, alpha: 1))
let creamBgColor = Color(#colorLiteral(red: 242/256, green: 230/256, blue: 211/256, alpha: 1))
let splashBgColor = Color(#colorLiteral(red: 153/256, green: 0/256, blue: 19/256, alpha: 1))
// let textColor =

struct ContentView: View {
    var body: some View {
        VStack {
            Welcome(name: "Alejandro")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Splash: View {
    var body: some View {
        HStack {
            Spacer()
            VStack {
                Spacer()
                Image("logo")
                    .resizable()
                    .frame(width: 106, height: 133)
                Spacer()
                Text("Derechos Reservados 2022")
                    .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.4)))
                    .font(.system(size: 15))
            }
            Spacer()
        }
        .background(splashBgColor)
    }
}

struct Login: View {
    var body: some View {
        ZStack {
            VStack {
                Circle()
                    .fill(redBgColor)
                    .padding(.top, -450)
                    .frame(width: 625, height: 625)
                Spacer()
            }
            VStack {
                Spacer()
                Text("¡Te damos la\nbienvenida!")
                    .foregroundColor(.white)
                    .font(.system(size: 40, weight: .semibold, design: .default))
                Image("logo")
                    .resizable()
                    .frame(width: 106, height: 133)
                Spacer()
                VStack {
                    Button(action: {}, label: {
                        LoginButton(txt: "Iniciar sesión con Google", img: "google", fgColor: .gray, bgColor: .white)
                    })
                    Button(action: {}, label: {
                        LoginButton(txt: "Iniciar sesión con Apple", img: "apple", fgColor: .white, bgColor: .black)
                    })
                    Button(action: {}, label: {
                        HStack {
                            Text("seguir")
                                .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.2)))
                                .padding(.trailing, -2)
                            Text("anónimo")
                                .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.2)))
                                .padding(.leading, -2)
                                .font(.system(size: 20, weight: .bold))
                        }
                    })
                    .padding(.top, 45)

                }
                Spacer()
                HStack {
                    Text("Continuando aceptas los")
                        .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.2)))
                        .font(.system(size: 15))
                        .padding(.trailing, -2)
                    Button(action: {}, label: {
                        Text("Términos y Condiciones")
                            .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.2)))
                            .font(.system(size: 15, weight: .bold))
                            .padding(.leading, -2)
                    })
                }
            }
        }
        .background(creamBgColor)
    }
}

struct Welcome: View {
    let hello: String

    init() { self.hello = "¡Hola!" }
    init(name: String) { self.hello = "¡Hola, " + name + "!" }

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

struct LoginButton: View {
    let txt: String,
        img: String,
        fgColor: Color,
        bgColor: Color

    init(txt: String,
         img: String,
         fgColor: Color,
         bgColor: Color) {
        self.txt = txt
        self.img = img
        self.fgColor = fgColor
        self.bgColor = bgColor
    }

    var body: some View {
        ZStack {
            Rectangle()
                .fill(bgColor)
                .frame(width: 345, height: 54)
                .cornerRadius(10)
            HStack {
                Image(img)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 24, height: 24)
                Text(txt)
                    .foregroundColor(fgColor)
                    .font(.system(size: 20, weight: .semibold))
            }
        }
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
