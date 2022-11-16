//
//  Splash.swift
//  TuHuellaAlimentariaBAMX
//
//  Created by rody on 26/10/22.
//

import SwiftUI

struct Splash: View {
    
    @StateObject var viewRouter: ViewRouter
    
    let bg: Color
    init(viewRouter: ViewRouter, bg: Color) {
        _viewRouter =  StateObject(wrappedValue: viewRouter)
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
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    viewRouter.currentPage = .login
                }
            }
            Spacer()
        }
        .background(bg)
    }
}

struct Splash_Previews: PreviewProvider {
    static var previews: some View {
        Splash(
            viewRouter: ViewRouter(),
            bg: Color(#colorLiteral(red: 219/256, green: 62/256, blue: 76/256, alpha: 1))
        )
    }
}
