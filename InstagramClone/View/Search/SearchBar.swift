//
//  SearchBar.swift
//  InstagramClone
//
//  Created by Gustavo Carvalho on 20/04/22.
//

import SwiftUI

struct SearchBar: View {
    
    @Binding var text: String
    @Binding var isEditing: Bool
    
    @State private var opacityValue: Double = 0
    @State private var offsetValue: CGFloat = 100
    
    var body: some View {
        HStack {
            TextField("Search...", text: $text)
                .padding(8)
                .padding(.horizontal, 24)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                    }
                )
                .onTapGesture {
                    isEditing = true
                    withAnimation(.default) {
                        opacityValue = 1
                        offsetValue = 0
                    }
                }
            
            if isEditing {
                Button(action: {
                    isEditing = false
                    text = ""
                    UIApplication.shared.endEditing()
                    withAnimation(.default) {
                        opacityValue = 0
                        offsetValue = 100
                    }
                }) {
                    Text("Cancel")
                }
                .padding(.trailing, 8)
                .offset(x: offsetValue)
                .opacity(opacityValue)
            }
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant("hello world"), isEditing: .constant(true))
    }
}
