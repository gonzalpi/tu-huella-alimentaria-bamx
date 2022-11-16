//
//  TuHuellaAlimentariaBAMXApp.swift
//  TuHuellaAlimentariaBAMX
//
//  Created by álex on 22.10.22.
//

import SwiftUI

@main
struct TuHuellaAlimentariaBAMXApp: App {
    
    @StateObject var viewRouter =  ViewRouter()
    
    var body: some Scene {
        WindowGroup {
            MotherView(viewRouter: viewRouter)
        }
    }
}
