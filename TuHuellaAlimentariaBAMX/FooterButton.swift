//
//  FooterButton.swift
//  TuHuellaAlimentariaBAMX
//
//  Created by rody on 30/10/22.
//

import SwiftUI

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

struct FooterButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Spacer()
            FooterButton()
                .padding(.bottom, -80)
        }
    }
}
