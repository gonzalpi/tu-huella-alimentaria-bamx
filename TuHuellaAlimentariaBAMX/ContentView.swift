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

struct ContentView: View {
    var body: some View {
        VStack {
            // Splash(bg: splashBgColor)
            // Login(bg: creamBgColor, fg: redBgColor)
            // Welcome(bg: creamBgColor, fg: redBgColor)
            Welcome(name: "Alejandro", bg: creamBgColor, fg: redBgColor)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
