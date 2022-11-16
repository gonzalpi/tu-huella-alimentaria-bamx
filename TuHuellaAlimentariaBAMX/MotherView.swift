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
            Question(viewRouter: viewRouter,q: "¿Cuántas veces vas al súper al mes?", bg: creamColor, fg: redColor)
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
