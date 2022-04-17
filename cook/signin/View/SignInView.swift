//
//  SignInView.swift
//  cook
//
//  Created by Davi Aquila on 2022-04-17.
//

import SwiftUI

struct SignInView: View {
    
    @ObservedObject var viewModel: SignInViewModel
    
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        Group {
            switch viewModel.uiState {
                case .GO_TO_HOME:
                    viewModel.goToHome()
                default:
                    NavigationView {
                        ScrollView(showsIndicators: false) {
                            VStack(alignment: .center, spacing: 20) {
                                VStack(alignment: .center, spacing: 8) {
                                    logo
                                    emailField
                                    passwordField
                                    signInButton
                                    Spacer()
                                }
                            }
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .padding(.horizontal, 16)
                            
                            if case SignInUIState.FAILURE(let message) = viewModel.uiState {
                                    CookAlert(content: message)
                                }
                        }
                    }
            }
        }
    }
}

extension SignInView {
    var logo: some View {
        Image("Logo")
            .resizable()
            .scaledToFit()
            .padding(.horizontal, 100)
            .padding(.bottom, 20)
    }
    
    var emailField: some View {
        CookTextField(placeHolder: "Email", binding: $email, capitalization: .never,errorMessage: "Email inválido" ,failure: !email.isEmail(),
                        keyboard: .emailAddress)
            .padding(.bottom, 15)
    }
    
    var passwordField: some View {
        CookTextField(placeHolder: "Senha", binding: $password, capitalization: .never, errorMessage: "Sua senha deve conter pelo menos 8 caracteres", failure: password.count < 6, isSecure: true)
            .padding(.bottom, 20)
    }
        
    var signInButton: some View {
        CookButton(text: "Entrar", showProgress: viewModel.uiState == SignInUIState.LOADING, disabled: !email.isEmail() || password.count < 6) {
            viewModel.signIn(email: email, password: password)
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = SignInViewModel()
        SignInView(viewModel: viewModel)
    }
}
