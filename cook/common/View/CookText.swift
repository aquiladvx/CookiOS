//
//  CookText.swift
//  cook
//
//  Created by Davi Aquila on 2022-04-23.
//

import SwiftUI

struct CookText: View {
    var text: String
    var customFont: String
    var size: CGFloat
    var color: Color
    
    init(_ text: String, customFont: String = "Raleway", size: CGFloat = 20, color: Color = Color("Text")) {
        self.text = text
        self.customFont = customFont
        self.size = size
        self.color = color
    }
    
    var body: some View {
        Text(text)
            .font(Font.custom(customFont, size: size))
            .foregroundColor(color)
    }
}

struct CookText_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) { value in
            CookText("Olá, Mundo!")
                .preferredColorScheme(value)
                .padding()
        }
    }
}
