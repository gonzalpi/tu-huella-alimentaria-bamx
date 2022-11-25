//
//  TuHuellaAlimentariaBAMXApp.swift
//  TuHuellaAlimentariaBAMX
//
//  Created by álex on 22.10.22.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct TuHuellaAlimentariaBAMXApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var viewRouter =  ViewRouter()
    @StateObject var viewModel = AuthenticationViewModel()
    @StateObject var questionViewModel = QuestionsViewModel()
    
    var body: some Scene {
        WindowGroup {
            MotherView(viewRouter: viewRouter)
                .environmentObject(viewModel)
                .environmentObject(questionViewModel)
                .onAppear {
                    questionViewModel.listentoRealtimeDatabase()
                }
        }
    }
}
