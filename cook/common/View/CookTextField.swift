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
                SecureField("", text: $binding)
                    .placeholder(when: binding.isEmpty) {
                        CookText(placeHolder, color: Color("TextWeak"))
                    }
                    .font(.title3)
                    .foregroundColor(Color("Text"))
                    .padding()
                    .keyboardType(keyboard)
                    .textInputAutocapitalization(capitalization)
                    .frame(maxWidth: .infinity)
                    .background(Color("EditTextBackgroundColor"))
                    .overlay(RoundedRectangle(cornerRadius: 6.0).strokeBorder(Color("StrokeColor"), style: StrokeStyle(lineWidth: 2.0)))
                    .cornerRadius(6)
                    .disableAutocorrection(true)
            } else {
                TextField("", text: $binding)
                    .placeholder(when: binding.isEmpty) {
                        CookText(placeHolder, color: Color("TextWeak"))
                    }
                    .font(.title3)
                    .foregroundColor(Color("Text"))
                    .padding()
                    .keyboardType(keyboard)
                    .textInputAutocapitalization(capitalization)
                    .frame(maxWidth: .infinity)
                    .background(Color("EditTextBackgroundColor"))
                    .overlay(RoundedRectangle(cornerRadius: 6.0).strokeBorder(Color("StrokeColor"), style: StrokeStyle(lineWidth: 2.0)))
                    .cornerRadius(6)
                    .disableAutocorrection(true)
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
            VStack {
                CookTextField(
                    placeHolder: "Insira seu email", binding: .constant("")).padding()
                    .preferredColorScheme(value)
                CookTextField(
                    placeHolder: "Insira sua senha", binding: .constant(""), isSecure: true).padding()
                    .preferredColorScheme(value)
            }
        }
    }
}
