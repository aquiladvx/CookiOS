//
//  CookButton.swift
//  cook
//
//  Created by Davi Aquila on 2022-04-17.
//

import SwiftUI

struct CookButton: View {
    var text: String
    var showProgress = false
    var disabled = false
    var action: () -> Void
    
    var body: some View {
        ZStack {
            Button(action: action, label: {
                Text(showProgress ? "" : text)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
            })
                .background(disabled ? Color("DisablePrimaryColor") : Color("PrimaryColor"))
                .cornerRadius(10)
                .disabled(showProgress || disabled)
                .shadow(color: Color("TextColor").opacity(0.2), radius: 10, x: -5, y: 5)
            
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
                .opacity(showProgress ? 1 : 0)
        }


    }
}

struct CookButton_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) { value in
            CookButton(text: "Entrar") {
                
            }.preferredColorScheme(value)
        }
    }
}
