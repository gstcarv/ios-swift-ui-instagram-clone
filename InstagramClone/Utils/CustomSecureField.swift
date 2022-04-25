//
//  CustomSecureField.swift
//  InstagramClone
//
//  Created by Gustavo Carvalho on 25/04/22.
//

import SwiftUI

struct CustomSecureField: View {
    @Binding var text: String
    var placeholder: String
    
    var body: some View {
        ZStack (alignment: .leading) {
            if text.isEmpty {
                Text(placeholder)
                    .foregroundColor(Color(.init(white: 1, alpha: 0.8)))
                    .padding(.leading, 55)
            }
            
            HStack {
                Image(systemName: "lock")
                    .resizable()
                    
                    .frame(width: 17, height: 21)
                    .foregroundColor(.white)
                
                SecureField("", text: $text)
                    .foregroundColor(.white)
                    .padding(.leading, 10)
            }
            .padding()
            .padding(.horizontal, 5)
            .background(Color(.init(white: 1, alpha: 0.15)))
            .cornerRadius(8)
        }
    }
}

struct CustomSecureField_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            
            LinearGradient(
                gradient: Gradient(
                    colors: [Color.purple, Color.blue]
                ),
                startPoint: .top,
                endPoint: .bottom
            ).ignoresSafeArea()
            
            VStack {
                CustomSecureField(
                    text: .constant(""), placeholder: "My placeholder"
                )
            }.padding()
        }
    }
}
