//
//  SplashViewModel.swift
//  cook
//
//  Created by Davi Aquila on 2022-03-18.
//

import SwiftUI

class SplashViewModel: ObservableObject {
    
    @Published var uiState: SplashUIState = .LOADING
    
    func onAppear() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            withAnimation {
//            self.uiState = .FAILURE(errorMessage: "Erro no contato com o servidor")
                self.uiState = .GO_TO_SIGNIN
            }
        }
    }
}


extension SplashViewModel {
    func goToSignIn() -> some View {
        return SplashViewRouter.makeSignInView()
    }
    
    func goToHome() -> some View {
        return SplashViewRouter.makeHomeView()
    }
}
