//
//  cookApp.swift
//  cook
//
//  Created by Davi Aquila on 2022-03-18.
//

import SwiftUI
import Firebase

@main
struct cookApp: App {
    var body: some Scene {
        WindowGroup {
            let viewModel = SplashViewModel()
            SplashView(viewModel: viewModel)
        }
    }
    
    init() {
        FirebaseApp.configure()
    }
}
