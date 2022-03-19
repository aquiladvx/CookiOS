//
//  SplashView.swift
//  cook
//
//  Created by Davi Aquila on 2022-03-18.
//

import SwiftUI

struct SplashView: View {
    
    @ObservedObject var viewModel: SplashViewModel
    
    var body: some View {
        Group {
            switch viewModel.uiState {
                case .LOADING:
                    loadingView()
                case .GO_TO_SIGNIN:
                    viewModel.goToSignIn()
                case .GO_TO_HOME:
                    viewModel.goToHome()
                case .FAILURE(let errorMessage):
                    loadingView(error: errorMessage)
            }
        }.onAppear(perform: viewModel.onAppear)
    }
}

extension SplashView {
    func loadingView(error: String? = nil) -> AnyView {
        return AnyView(
            ZStack {
                Image("Logo")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding(20)
                    .background(Color.white)
                    .ignoresSafeArea()
                
                if let error = error {
                    Text("")
                        .alert(isPresented: .constant(true)) {
                            Alert(title: Text("Alert"), message: Text(error), dismissButton: .default(Text("Ok")) {
                                //TODO somethings happens after error
                            })
                        }
                }
            }
        )
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            let viewModel = SplashViewModel()
            SplashView(viewModel: viewModel)
        }
    }
}
