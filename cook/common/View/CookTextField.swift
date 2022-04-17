//
//  CookTextField.swift
//  cook
//
//  Created by Davi Aquila on 2022-04-17.
//

import SwiftUI

struct CookTextField: View {
    var placeHolder: String
    @Binding var binding: String
    var capitalization: TextInputAutocapitalization? = nil
    var errorMessage: String? = nil
    var failure: Bool? = nil
    var keyboard: UIKeyboardType = .default
    var isSecure: Bool = false
    
    var body: some View {
        VStack {
            if isSecure {
                SecureField(placeHolder, text: $binding)
                    .font(.title3)
                    .foregroundColor(Color("TextColor"))
                    .padding()
                    .keyboardType(keyboard)
                    .textInputAutocapitalization(capitalization)
                    .overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(Color("StrokeColor"), style: StrokeStyle(lineWidth: 2.0)))
                    .frame(maxWidth: .infinity)
                    .background(Color("BackgroundColor"))
            } else {
                TextField(placeHolder, text: $binding)
                    .font(.title3)
                    .foregroundColor(Color("TextColor"))
                    .padding()
                    .keyboardType(keyboard)
                    .textInputAutocapitalization(capitalization)
                    .overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(Color("StrokeColor"), style: StrokeStyle(lineWidth: 2.0)))
                    .frame(maxWidth: .infinity)
                    .background(Color("BackgroundColor"))
            }
            if let error = errorMessage, failure == true, !binding.isEmpty {
                Text(error)
                    .foregroundColor(.red)
            }
        }
    }
}

struct CookTextField_Previews: PreviewProvider {
    
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) { value in
            CookTextField(
                placeHolder: "Insira seu email", binding: .constant(""))
                .preferredColorScheme(value)
        }
    }
}
