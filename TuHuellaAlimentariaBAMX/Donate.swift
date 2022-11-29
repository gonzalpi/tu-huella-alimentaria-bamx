//
//  Donate.swift
//  TuHuellaAlimentariaBAMX
//
//  Created by rody on 30/10/22.
//

import SwiftUI
import GoogleSignIn
import Firebase
import WebKit

struct WebView: UIViewRepresentable {
 
    var url: URL
 
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
 
    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
}

struct Donate: View {
    @EnvironmentObject var viewRouter: ViewRouter
    private let user = GIDSignIn.sharedInstance.currentUser
    @StateObject var database = DatabaseModel()
    
    let bg: Color,
        fg: Color
    @State var amount = 500
    init(bg: Color, fg: Color) {
        self.bg = bg
        self.fg = fg
    }
    @State private var showWebView = false
    var body: some View {
        ZStack {
            VStack {
                Image("donate_bg")
                    .renderingMode(.template)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(fg)
                    .frame(width: UIScreen.main.bounds.width)
                    .padding(.top, -450)
            }
            VStack {
                Spacer()
                Text("¡Terminemos el hambre!")
                    .frame(width: UIScreen.main.bounds.width - 50)
                    .foregroundColor(.white)
                    .font(.system(size: 30, weight: .semibold, design: .default))
                    .multilineTextAlignment(.center)
                Spacer(minLength: 150)
                HStack {
                    Button(action: { (amount > 500) ? (amount = amount - 100) : (amount = 500)}, label: {
                        Image("minus")
                            .renderingMode(.template)
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 45, height: 45)
                    })
                    .padding(.trailing)
                    Text("\(amount)")
                        .foregroundColor(.white)
                        .font(.system(size: 40, weight: .semibold, design: .default))
                    Button(action: {(amount < 1000000) ? (amount = amount + 100) : (amount = 1000000)}, label: {
                        Image("plus")
                            .renderingMode(.template)
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 45, height: 45)
                    })
                    .padding(.leading)
                }
                Text("MXN")
                    .foregroundColor(.white)
                    .font(.system(size: 32, weight: .regular, design: .default))
                Spacer()
                Button {
                    // Post user data to database if logged in
                    if (user?.profile?.email != nil) {
                        // Post footprint and donated amount
                        database.setUserData(email: user?.profile?.email ?? "default", name: user?.profile?.name ?? "", footprint: amount, donation: viewRouter.points*10)
                    } else {
                        database.setAnonymousData(footprint: amount, donation: viewRouter.points*10)
                    }
                    showWebView.toggle()
                } label: {
                    ZStack {
                        Rectangle()
                            .fill(fg)
                            .frame(width: 191, height: 62)
                            .cornerRadius(43)
                        Text("¡Ayudemos!")
                            .font(.system(size: 20, weight: .regular))
                            .foregroundColor(.white)
                    }
                }
                .sheet(isPresented: $showWebView) {
                    HStack{
                        Spacer()
                        Button(action:{
                            showWebView = false
                        },label:{
                            Text("Cancelar")
                            .foregroundColor(Color(.systemBlue))
                            .font(.system(size: 15, weight: .semibold))
                            .padding()})
                    }
                    WebView(url: URL(string: "https://bdalimentos.org/make-a-donation/?cause_id=8492")!)
                }
            
                Spacer()
                HStack {
                    Text("Juntos\nayudaremos a\nfamilias")
                        .font(.system(size: 20, weight: .bold))
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(.white)
                    Text("\(Int(ceil(Double(amount/500))))")
                        .font(.system(size: 96, weight: .bold))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .padding(.leading)
                    Image("family")
                        .renderingMode(.template)
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width: 90, height: 90)
                        .padding(.leading)
                }
                .padding(.bottom)
                Button(action: {viewRouter.currentPage = .splash}, label: {
                    Image("home")
                        .renderingMode(.template)
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width: 30, height: 30)
                })
            }
        }
        .background(bg)
    }
}

struct Donate_Previews: PreviewProvider {
    static var previews: some View {
        Donate(
            bg: Color(#colorLiteral(red: 242/256, green: 230/256, blue: 211/256, alpha: 1)),
            fg: Color(#colorLiteral(red: 219/256, green: 62/256, blue: 76/256, alpha: 1))
        )
    }
}
