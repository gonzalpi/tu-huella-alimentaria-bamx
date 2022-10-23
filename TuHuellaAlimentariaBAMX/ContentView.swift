//
//  ContentView.swift
//  TuHuellaAlimentariaBAMX
//
//  Created by álex on 22.10.22.
//

import SwiftUI

let redBgColor = Color(#colorLiteral(red: 219/256, green: 62/256, blue: 76/256, alpha: 1))
let splashBgColor = Color(#colorLiteral(red: 153/256, green: 0/256, blue: 19/256, alpha: 1))
// let textColor =

struct ContentView: View {
    var body: some View {
        VStack {
            Splash()
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
            }
            Spacer()
        }
        .background(splashBgColor)
    }
}
