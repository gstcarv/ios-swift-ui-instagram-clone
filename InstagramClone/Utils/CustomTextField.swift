//
//  CustomTextField.swift
//  InstagramClone
//
//  Created by Gustavo Carvalho on 25/04/22.
//

import SwiftUI

struct CustomTextField: View {
    @Binding var text: String
    var placeholder: String
    var icon: String
    
    var body: some View {
        ZStack (alignment: .leading) {
            if text.isEmpty {
                Text(placeholder)
                    .foregroundColor(Color(.init(white: 1, alpha: 0.8)))
                    .padding(.leading, 55)
            }
            
            HStack {
                Image(systemName: icon)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 17, height: 17)
                    .foregroundColor(.white)
                
                TextField("", text: $text)
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

struct CustomTextField_Previews: PreviewProvider {
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
                CustomTextField(
                    text: .constant(""), placeholder: "My placeholder", icon: "envelope"
                )
            }.padding()
        }
    }
}
