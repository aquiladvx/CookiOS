//
//  CookClickableText.swift
//  cook
//
//  Created by Davi Aquila on 2022-04-23.
//

import SwiftUI

struct CookClickableText: View {
    var text: String
    var customFont: String
    var size: CGFloat
    var action: () -> Void
    
    init(_ text: String, customFont: String = "Raleway", size: CGFloat = 20, action: @escaping () -> Void) {
        self.text = text
        self.customFont = customFont
        self.size = size
        self.action = action
    }
    
    var body: some View {
        Text(text)
            .underline()
            .font(Font.custom(customFont, size: size))
            .foregroundColor(Color("PrimaryColor"))
            .onTapGesture(perform: action)
    }
}

struct CookClickableText_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) { value in
            CookClickableText("Olá, Mundo!") {}
                .preferredColorScheme(value)
                .padding()
        }
    }
}
