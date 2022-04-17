//
//  SignInViewRouter.swift
//  cook
//
//  Created by Davi Aquila on 2022-04-17.
//

import SwiftUI

enum SignInViewRouter {
    
    static func makeHomeView() -> some View {
        let viewModel = HomeViewModel()
        return HomeView(viewModel: viewModel)
    }
}
