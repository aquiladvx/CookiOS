//
//  CookAlert.swift
//  cook
//
//  Created by Davi Aquila on 2022-04-17.
//

import SwiftUI

struct CookAlert: View {
    var title: String = "Alert"
    var content: String
    var buttonText: String = "Ok"
    
    var body : some View {
        Text("")
        .alert(isPresented: .constant(true)) {
            Alert(title: Text(title), message: Text(content), dismissButton: .default(Text(buttonText)) {
                //TODO somethings happens after error
            })
        }
    }
}

struct CookAlert_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) { value in
            CookAlert(content: "Testando alerta")
                .preferredColorScheme(value)
        }
    }
}
