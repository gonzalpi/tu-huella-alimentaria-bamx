//
//  Splash.swift
//  TuHuellaAlimentariaBAMX
//
//  Created by rody on 26/10/22.
//

import SwiftUI

struct Splash: View {
    let bg: Color
    init(bg: Color) {
        self.bg = bg
    }
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
        .background(bg)
    }
}
