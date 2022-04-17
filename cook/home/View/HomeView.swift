//
//  HomeView.swift
//  cook
//
//  Created by Davi Aquila on 2022-04-17.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        Group {
            switch viewModel.uiState {
            case .NONE:
                CookButton(text: "sair") {
                    viewModel.signOut()
                }
            case .GO_TO_SIGNIN:
                viewModel.goToSignIn()
                
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = HomeViewModel()
        HomeView(viewModel: viewModel)
    }
}
