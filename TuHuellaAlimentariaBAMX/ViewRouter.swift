//
//  ViewRouter.swift
//  TuHuellaAlimentariaBAMX
//
//  Created by Carlos Garcia Mercado on 16/11/22.
//

import SwiftUI

class ViewRouter: ObservableObject {
    
    @Published var currentPage : Page = .splash
    @Published var points : Int = 0
}
