//
//  SplashUiState.swift
//  cook
//
//  Created by Davi Aquila on 2022-03-18.
//

import Foundation

enum SplashUIState {
    case LOADING
    case GO_TO_SIGNIN
    case GO_TO_HOME
    case FAILURE(errorMessage: String)
}
