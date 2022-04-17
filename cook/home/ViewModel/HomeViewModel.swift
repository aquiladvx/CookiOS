//
//  HomeViewModel.swift
//  cook
//
//  Created by Davi Aquila on 2022-04-17.
//

import SwiftUI
import FirebaseAuth

class HomeViewModel: ObservableObject {
    
    @Published var uiState: HomeUIState = .NONE
    
    let auth = Auth.auth()
    
    func signOut() {
        try? auth.signOut()
        
        uiState = .GO_TO_SIGNIN
    }
}

extension HomeViewModel {
    func goToSignIn() -> some View {
        return HomeViewRouter.makeSignInView()
    }
}
