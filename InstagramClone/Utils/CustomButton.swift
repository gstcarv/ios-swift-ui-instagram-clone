//
//  CustomButton.swift
//  InstagramClone
//
//  Created by Gustavo Carvalho on 16/05/22.
//

import SwiftUI

struct CustomButton: View {
    
    var action: () -> Void
    var label: () -> Text;
    var loading: Bool;
    var loadingColor = Color.black
    
    var body: some View {
        Button(action: action) {
            if !loading {
                label()
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 10)
            } else {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: loadingColor))
            }
        }
        .disabled(loading)
    }
}
