//
//  SignInUIState.swift
//  cook
//
//  Created by Davi Aquila on 2022-04-17.
//

import Foundation

enum SignInUIState: Equatable {
    case NONE
    case LOADING
    case GO_TO_HOME
    case FAILURE(errorMessage: String)
}
