//
//  TextArea.swift
//  InstagramClone
//
//  Created by Gustavo Carvalho on 02/05/22.
//

import SwiftUI

struct TextArea: View {
    
    @Binding var text: String;
    var placeholder: String;
    
    var body: some View {
        ZStack (alignment: .topLeading) {
            TextEditor(text: $text)
                .padding(4)
            
            if text.isEmpty {
                Text(placeholder)
                    .foregroundColor(Color(UIColor.placeholderText))
                    .padding(.horizontal, 8)
                    .padding(.vertical, 12)
                    .allowsHitTesting(false)
            }
        }
        .font(.body)
    }
}

struct TextArea_Previews: PreviewProvider {
    static var previews: some View {
        TextArea(text: .constant(""), placeholder: "My Field")
    }
}
