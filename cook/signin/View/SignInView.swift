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
                            VStack(alignment: .leading, spacing: 8) {
                                Spacer(minLength: 100)
                                logo
                                title
                                inputArea
                            }
                            .frame(maxWidth: .infinity)
                            .padding(.horizontal, 16)
                            
                            if case SignInUIState.FAILURE(let message) = viewModel.uiState {
                                    CookAlert(content: message)
                                }
                        }.background(Color("PrimaryColor"))
                    }
            }
        }
    }
}

extension SignInView {
    var logo: some View {
        VStack(alignment: .center) {
            Image("Logo")
                .scaledToFit()
        }.frame(maxWidth: .infinity)
            
    }
    
    var title: some View {
        Text("Milhares de receitas\nGrátis esperando por você")
            .font(Font.custom("Raleway-SemiBold", size: 24))
            .foregroundColor(Color.white)
            .padding([.bottom, .top], 10)
    }
    
    var inputArea: some View {
        VStack(alignment: .center) {
            VStack(spacing: 10) {
                emailField
                signInButton
                anotherLoginOptionArea
                signUp
                missPassword
            }.padding(20)
        }
            .background(Color.white)
            .cornerRadius(10)
            
    }
    
    var signUp: some View {
        HStack {
            CookText("Ainda não tem cadastro?", size: 16)
            CookClickableText("Cadastrar", size: 16) {
                // TODO: cadastro de usuario
                print("click")
            }
            Spacer()
        }.frame(maxWidth: .infinity)
            .padding(.top, 10)
    }
    
    var missPassword: some View {
        HStack {
            CookClickableText("Esqueceu sua senha?", size: 16) {
                // TODO: recuperar senha
                print("click")
            }
            Spacer()
        }
    }
    
    var anotherLoginOptionArea: some View {
        VStack {
            CookText("ou")
            HStack(spacing: 20) {
                SocialButton(image: Image("AppleIcon"), color: Color.black, iconSize: 30)
                SocialButton(image: Image("FacebookIcon"), color: Color("FacebookColor"), iconSize: 25)
                SocialButton(image: Image("GoogleIcon"), color: Color.red, iconSize: 22)
            }
        }
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
        CookButton(text: "Continuar", showProgress: viewModel.uiState == SignInUIState.LOADING, disabled: !email.isEmail()) {
            viewModel.signIn(email: email, password: "123321")
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = SignInViewModel()
        ForEach(ColorScheme.allCases, id: \.self) { value in
            SignInView(viewModel: viewModel)
                .preferredColorScheme(value)
        }
    }
}
