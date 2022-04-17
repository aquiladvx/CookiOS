//
//  HomeViewRouter.swift
//  cook
//
//  Created by Davi Aquila on 2022-04-17.
//

import SwiftUI

enum HomeViewRouter {
    
    static func makeSignInView() -> some View {
        let viewModel = SignInViewModel()
        return SignInView(viewModel: viewModel)
    }
}
