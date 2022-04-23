//
//  SocialButton.swift
//  cook
//
//  Created by Davi Aquila on 2022-04-23.
//

import SwiftUI

struct SocialButton: View {
    
    var image: Image
    var color: Color = Color.black
    var iconSize: CGFloat = 30
    var body: some View {
        ZStack {
            image
                .resizable()
                .frame(width: iconSize, height: iconSize, alignment: .center)
                .padding(10)
        }
            .frame(maxWidth: .infinity, minHeight: 50, maxHeight: 50)
            .background(color)
            .cornerRadius(6)
//        Spacer()
//        .padding()
//        .frame(maxWidth: .infinity)
//        .background(Color("BackgroundColor"))
//        .cornerRadius(10)
//        .shadow(color: Color("TextColor").opacity(0.2), radius: 10, x: -5, y: 5)
    }
}

struct SocialButton_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) { value in
            HStack {
                SocialButton(image: Image("AppleIcon"))
                    .preferredColorScheme(value)
                
                SocialButton(image: Image("Logo"))
                    .preferredColorScheme(value)
            }

        }
    }
}
