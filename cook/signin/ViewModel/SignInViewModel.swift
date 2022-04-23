//
//  SignInViewModel.swift
//  cook
//
//  Created by Davi Aquila on 2022-04-17.
//

import SwiftUI
import FirebaseAuth

class SignInViewModel: ObservableObject {
    
    @Published var uiState: SignInUIState = .NONE
    
    let auth = Auth.auth()
    var isSignedIn: Bool {
        return auth.currentUser != nil
    }
    
    init() {
        if (isSignedIn) {
            uiState = .GO_TO_HOME
        }
    }
    
    func signIn(email: String, password: String) {
        self.uiState = .LOADING
        
        auth.signIn(withEmail: email, password: password) { result, error in
            guard result != nil, error == nil else {
                print(error)
                self.uiState = .FAILURE(errorMessage: error?.localizedDescription ?? "Erro Desconhecido")
                return
            }
            
            //SUCCESS
            withAnimation {
                self.uiState = .GO_TO_HOME
            }
        }
    }
    
}

extension SignInViewModel {
    func goToHome() -> some View {
        return SignInViewRouter.makeHomeView().transition(.slide.animation(.default))
    }
}
