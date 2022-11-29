//
//  Login.swift
//  TuHuellaAlimentariaBAMX
//
//  Created by rody on 26/10/22.
//

import SwiftUI
import PDFKit

struct SheetView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        HStack{
            Spacer()
            Button("Acepto"){
                dismiss()
            }
            .foregroundColor(Color(.systemBlue))
            .font(.system(size: 15, weight: .semibold))
            .padding()
        }
        PDFKitView(url: Bundle.main.url(forResource: "PrivacyPolicy", withExtension: "pdf")!)
    }
}

struct PDFKitView: View {
    var url: URL
    var body: some View {
        PDFKitRepresentedView(url)
    }
}

struct PDFKitRepresentedView: UIViewRepresentable {
    let url: URL
    init(_ url: URL) {
        self.url = url
    }

    func makeUIView(context: UIViewRepresentableContext<PDFKitRepresentedView>) -> PDFKitRepresentedView.UIViewType {
        let pdfView = PDFView()
        pdfView.document = PDFDocument(url: self.url)
        pdfView.autoScales = true
        return pdfView
    }

    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<PDFKitRepresentedView>) {
        // Update the view.
    }
}
struct Login: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    @EnvironmentObject var authViewModel: AuthenticationViewModel
    
    let bg: Color,
        fg: Color
    init(bg: Color, fg: Color) {
        self.bg = bg
        self.fg = fg
    }
    
    let filePath = Bundle.main.url(forResource: "PrivacyPolicy", withExtension: "pdf")!
    @State private var showingSheet = false

    var body: some View {
        ZStack {
            VStack {
                Circle()
                    .fill(fg)
                    .padding(.top, -450)
                    .frame(width: 625, height: 625)
                Spacer()
            }
            VStack {
                Spacer()
                Text("¡Te damos la bienvenida!")
                    .foregroundColor(.white)
                    .font(.system(size: 40, weight: .semibold, design: .default))
                    .multilineTextAlignment(.center)
                    .frame(width: UIScreen.main.bounds.width - 50)
                Image("logo")
                    .resizable()
                    .frame(width: 106, height: 133)
                Spacer()
                VStack {
                    Button(
                        action: {
                            authViewModel.signIn(viewRouter: viewRouter)
                            // viewRouter.currentPage = .welcome
                        },
                        label: {
                            LoginButton(
                                txt: "Iniciar sesión con Google",
                                img: "google",
                                fgColor: .gray,
                                bgColor: .white
                            )
                        }
                    )
                    Button(
                        action: {
                            viewRouter.currentPage = .welcome
                        },
                        label: {
                            HStack {
                                Text("seguir")
                                    .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.2)))
                                    .padding(.trailing, -2)
                                Text("anónimo")
                                    .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.2)))
                                    .padding(.leading, -2)
                                    .font(.system(size: 20, weight: .bold))
                            }
                        }
                    )
                    .padding(.top, 45)

                }
                Spacer()
                HStack {
                    Text("Continuando aceptas los")
                        .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.2)))
                        .font(.system(size: 15))
                        .padding(.trailing, -2)
                    let tc = "Términos y Condiciones"
                    Button(tc) {
                                showingSheet.toggle()
                            }
                            .sheet(isPresented: $showingSheet) {
                                SheetView()
                            }
                            .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.2)))
                            .font(.system(size: 15, weight: .bold))
                            .padding(.leading, -2)
                }
            }
        }
        .background(bg)
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

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login(
            bg: Color(#colorLiteral(red: 242/256, green: 230/256, blue: 211/256, alpha: 1)),
            fg: Color(#colorLiteral(red: 219/256, green: 62/256, blue: 76/256, alpha: 1))
        )
    }
}
